class IdeasController < ApplicationController
  before_action :set_user

  def set_user
    @user = current_user
  end

  def index
    @ideas = current_user.ideas.all
  end

  def new
    @idea = current_user.ideas.new
    @categories = Category.all
    @images = Image.all
  end

  def create
    @idea = current_user.ideas.create(idea_params)
    if @idea.save
      params[:idea][:image_id].each do |image_id|
        unless image_id.empty?
          IdeaImage.create(idea: @idea, image_id: image_id)
        end
      end
      flash[:success] = "You have created, #{@idea.title}!"
      redirect_to user_idea_path(@user, @idea)
    else
      flash[:failed] = 'You forgot something'
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @images = @idea.images
  end

  def edit
    @idea = Idea.find(params[:id])
    @categories = Category.all
    @images = Image.all
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} updated!"
      redirect_to user_idea_path(@user, @idea)
    else
      flash[:failes] = "#{@idea.title} missing needed info"
      render :edit
    end
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy
    flash[:success] = "#{idea.title} was successfully deleted!"
    redirect_to user_ideas_path(@user)
  end

  private

  def idea_params
    params.require(:idea).permit(:category_id, :title, :description, :image_id)
  end
end
