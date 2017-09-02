class CategoriesController < ApplicationController

  # Show all categories
  def index
    @categories = Category.all.order(created_at: :desc)
  end

  # Show a specific category and it's products
  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
