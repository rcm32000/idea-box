class Admin::ImagesController < Admin::BaseController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    if Image.create!(image_params)
      flash[:success] = "You have created, #{Image.last.title}!"
      redirect_to admin_image_path(Image.last)
    else
      flash[:failed] = 'Uh...give it a name first?'
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    flash[:success] = "#{image.title} was successfully deleted!"
    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:title, :link)
  end
end
