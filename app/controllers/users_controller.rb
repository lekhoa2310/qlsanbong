class UsersController < ApplicationController
  skip_before_action :authenticate!, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "create a new user successfuly"
      redirect_to login_path
    else
      render :new
    end
  end

  def edit
      @user= User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
       @user.assign_attributes user_params
     if @user.valid?
       @user.update(user_params)
       flash[:success] = "Chỉnh sửa thành công!"

      redirect_to admin_dashboard_path if @user.is_admin
      redirect_to dashboard_path if @user.is_user
    else
       render :edit
    end
  end

  def changepassword
    @user= User.find(params[:id])
    @user.assign_attributes password_params
    if Digest::MD5::hexdigest(params[:old_password]) == @user.password
      if params[:password] == params[:password_confirmation]
        @user.update(password: params[:password])
        flash[:success] = "Change password successfuly"
      end
    else
      flash[:error_change] = "password is not correct"
    end
    redirect_to edit_user_path

  end


  private

  def user_params
    params.require(:user).permit(:name, :address, :phone, :email, :password)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
