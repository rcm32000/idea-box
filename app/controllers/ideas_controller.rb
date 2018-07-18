class IdeasController < ApplicationController
  def index
    @ideas = current_user.ideas.all
  end

  def new
    @idea = current_user.ideas.new
  end

  def create
    idea_data = idea_params
    idea_data[:user_id] = current_user.id
    if Idea.create!(idea_data)
      flash[:success] = "You have created, #{Idea.last.title}!"
      redirect_to ideas_path
    else
      flash[:failed] = 'You forgot something'
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} updated!"
      redirect_to idea_path(@idea)
    else
      flash[:failes] = "#{@idea.title} missing needed info"
      render :edit
    end
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy
    flash[:success] = "#{idea.title} was successfully deleted!"
    redirect_to ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:category_id, :title, :description)
  end
end
