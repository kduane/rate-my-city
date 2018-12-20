class ReviewsController < ApplicationController
  def index
    @city = City.find(params[:city_id])
    binding.pry
    @reviews = @city.reviews
  end

  def new
    @city = City.find(params[:city_id])
    @review = Review.new
  end

  def create
    @city = City.find(params[:city_id])
    @review = Review.new(review_params)
    @review.city = @city

    if @review.save
      flash[:notice] = "Review saved successfully."
      redirect_to review_path(@city)
    else
      flash[:alert] = "Failed to save review."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end

end
