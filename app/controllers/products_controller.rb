class ProductsController < ApplicationController

  # Show all products
  def index
    @products = Product.all.order(created_at: :desc)
  end

  # Show one specific product
  def show
    @product = Product.find params[:id]
    @review = Review.new
  end

end
