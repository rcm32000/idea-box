class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    if Category.create!(category_params)
      flash[:success] = "You have created, #{Category.last.name}!"
      redirect_to admin_category_path(Category.last)
    else
      flash[:failed] = 'Uh...give it a name first?'
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:success] = "#{category.name} was successfully deleted!"
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
