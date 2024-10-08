class CarsController < ApplicationController

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user

    if @car.save
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity

    end
  end

  def index
  end

  private

  def car_params
    params.require(:car).permit(:name, :brand, :category, :price_per_day, :photo)
  end
end
