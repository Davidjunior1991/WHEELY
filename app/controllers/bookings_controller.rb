class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :decline]

  def index
    # @user_bookings = Booking.where(car.user = current_user)
    @bookings = Booking.all
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

    if @booking.save!
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    @booking.update(status: "approved")
    @booking.car.booked = true
    redirect_to bookings_path, notice: "Booking approved."
  end

  def decline
    @booking.update(status: "declined")
    redirect_to bookings_path, notice: "Booking declined."
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :duration)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
