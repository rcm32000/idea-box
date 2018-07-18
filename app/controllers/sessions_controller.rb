class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to ideas_path
    else
      flash[:failed] = 'That Username/Password Combo Does Not Exist'
      render :new
    end
  end
end
