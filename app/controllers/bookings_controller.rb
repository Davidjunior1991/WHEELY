class BookingsController < ApplicationController
    def index
      raise
      @user_bookings = Booking.where(car.user = current_user) 
      @user_cars = Car.where(user = current_user) 
     end

  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    @booking.status = "pending"
    # raise
    if @booking.save!
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

 def edit
  end

  def update
  end

  private


  def booking_params
    params.require(:booking).permit(:date, :duration)
  end



end
