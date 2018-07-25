class Admin::BaseController < ApplicationController
  before_action :require_admin

  def dashboard
    @categories = Category.all
    @images = Image.all
    @users = User.all
    render admin_dashboard_path
  end

  private

  def require_admin
    render file: '/public/404' unless current_admin?
  end
end
