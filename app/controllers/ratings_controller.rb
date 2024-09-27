class RatingsController < ApplicationController
  before_action :set_car

  def create
    @rating = @car.ratings.new(rating_params)
    @rating.user = current_user  # Assuming you have user authentication

    if @rating.save
      redirect_to @car, notice: 'Rating was successfully created.'
    else
      redirect_to @car, alert: 'Unable to create rating.'
    end
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def rating_params
    params.require(:rating).permit(:score)
  end
end
