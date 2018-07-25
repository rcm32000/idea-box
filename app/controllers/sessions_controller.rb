class SessionsController < ApplicationController
  skip_before_action :require_user

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      user_direction_path
    else
      flash[:failed] = 'That Username/Password Combo Does Not Exist'
      render :new
    end
  end

  def user_direction_path
    if current_admin?
      redirect_to admin_dashboard_path
    else
      redirect_to ideas_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have been successfully logged out'
    redirect_to root_path
  end
end
