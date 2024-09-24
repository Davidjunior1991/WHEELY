class BookingsController < ApplicationController
    def index
      @user_bookings = Booking.where(user: current_user) 
      @user_cars = Car.where(user: current_user) 
     end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
