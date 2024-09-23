class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create!
    @car = Car.new(params[:car])
   @car.save
  end

  private
  def car_params
    params.require(:car).permit(:name, :brand, :category)
  end
end
