class ReviewsController < ApplicationController

  before_action :authorize


  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user = current_user
    @review.save

    if @review.save
      redirect_to [:products], notice: 'Product created!'
    # else
    #   render :new
    end

  end


  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to [:products], notice: 'Review deleted!'
  end





  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
