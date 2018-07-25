class Admin::UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to admin_user_path(@user)
    else
      flash[:failed] = 'That Username is Unavailable'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end
end
