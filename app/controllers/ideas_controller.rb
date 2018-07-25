class IdeasController < ApplicationController
  def index
    @ideas = current_user.ideas.all
  end

  def new
    @user = current_user
    @idea = current_user.ideas.new
  end

  def create
    idea_data = idea_params
    idea_data[:user_id] = current_user.id
    if params[:idea][:title].empty? || params[:idea][:description].empty?
      flash[:failed] = 'You forgot something'
      render :new
    else
      Idea.create(idea_data)
      flash[:success] = "You have created, #{Idea.last.title}!"
      redirect_to admin_user_idea_path(Idea.last)
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @images = Image.all
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} updated!"
      redirect_to admin_user_idea_path(@idea)
    else
      flash[:failes] = "#{@idea.title} missing needed info"
      render :edit
    end
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy
    flash[:success] = "#{idea.title} was successfully deleted!"
    redirect_to admin_user_ideas_path
  end

  private

  def idea_params
    params.require(:idea).permit(:category_id, :title, :description)
  end
end
