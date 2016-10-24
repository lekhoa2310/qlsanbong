class SessionsController < ApplicationController
  skip_before_action :authenticate!
  def new
    if @current_user
      redirect_to admin_dashboard_path if @current_user.is_admin
      redirect_to dashboard_path if @current_user.is_user
    end
  end
  def create
    user = User.find_by email: params[:session][:email]
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to admin_dashboard_path if user.is_admin
      redirect_to dashboard_path if user.is_user

    else
      flash[:error] = "email or password invalid"
      render :new
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path

  end
end
