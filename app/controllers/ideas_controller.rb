class IdeasController < ApplicationController
  def index
    @user = User.find_by_username(params[:username])
    @ideas = Idea.all
  end

  def new
    @user = User.find(params[:user_id])
    @idea = Idea.new
  end

  def create
    @user = User.find(params[:user_id])
    idea_data = idea_params
    idea_data[:user_id] = @user.id
    if Idea.create!(idea_data)
      flash[:success] = "You have created, #{Idea.last.title}!"
      redirect_to user_ideas_path(@user)
    else
      flash[:failed] = 'You forgot something'
      render :new
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:category_id, :title, :description)
  end
end
