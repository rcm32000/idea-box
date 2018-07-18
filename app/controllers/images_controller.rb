class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    if Image.create!(image_params)
      flash[:success] = "You have created, #{Image.last.title}!"
      redirect_to image_path(Image.last)
    else
      flash[:failed] = 'Title and link sailor!'
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:title, :link)
  end
end
