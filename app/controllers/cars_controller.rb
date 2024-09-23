class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create!
    @car = Car.new(params[:car])
   @car.save
  end
end
