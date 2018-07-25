class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_user
  helper_method :current_user
  helper_method :current_user?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?
    current_user
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def require_user
    unless current_user?
      flash[:failure] = 'Please Login'
      redirect_to root_path
    end
  end
end
