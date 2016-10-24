class ApplicationController < ActionController::Base
  before_action :current_user
  before_action :authenticate!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    @current_user ||= User.find_by id: session[:user_id]

  end

  def authenticate!
    redirect_to login_path if @current_user.nil?

  end
end
