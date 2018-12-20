class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    render :show
  end

  def new
    @city = City.new
  end

  def create
    # binding.pry
    @city = City.new(question_params)
    if @city.save
      flash[:notice] = 'New City saved!'
      redirect_to @city
    else
      render :new
    end
  end

  def search
    query = "%#{params[:query]}%"
    @cities = City
      .where('title ilike ? or description ilike ? or url ilike ?',
             query, query, query)
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if @city.update_attributes(question_params)
      flash[:notice] = 'Thanks for updating!'
      redirect_to @city
    else
      render 'edit'
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to @city
  end

  private

  def question_params
    params.require(:city).permit(:title, :description)
  end
end
