class Admin::CategoriesController < Admin::BaseController

  # Show categories to admin
  def index
    @categories = Category.order(id: :asc).all
  end

  # Add a new category by admin
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end



  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
