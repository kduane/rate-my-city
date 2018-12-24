class ReviewsController < ApplicationController
  def index
    @city = City.find(params[:city_id])
    @reviews = @city.reviews
  end

  def new
    @city = City.find(params[:city_id])
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
    @city = City.find(@review.city_id)
    # binding.pry
    render :show
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

  def edit
    @review = Review.find(params[:id])
    @city = City.find(@review.city_id)
    render :edit

  end

  def update
    @review = Review.find(params[:id])
    @city = City.find(@review.city_id)
    if @review.update_attributes(review_params)
      flash[:notice] = 'Thanks for updating!'
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @question
  end


  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end

end
