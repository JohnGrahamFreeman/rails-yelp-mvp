class ReviewsController < ApplicationController
  def new
    # GET  /restaurants/:restaurant_id/reviews/new
    # Render the form for creating a review

    # needed for simple form
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # POST /restaurants/:restaurant_id/reviews
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)

    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  # Returns a hash { content: "..." }
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
