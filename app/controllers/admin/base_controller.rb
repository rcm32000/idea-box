class Admin::BaseController < ApplicationController
  before_action :require_admin

  def root
    if current_admin?
      redirect_to admin_dashboard_path
    elsif
      current_user
      redirect_to user_ideas_path
    else
      render root
    end
  end

  def dashboard
    @categories_count = Category.count
    @images_count = Image.count
    @users_count = User.count
    render admin_dashboard_path
  end

  private

  def require_admin
    render file: '/public/404' unless current_admin?
  end
end
