class PagesController < ApplicationController
  def home
    @cars = Car.all
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
      }
    end
  end
end
