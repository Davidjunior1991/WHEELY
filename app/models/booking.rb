class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :status, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  enum status: { pending: 0, approved: 1, declined: 2 }
  validate :start_date_is_available

  private

  def start_date_is_available
    # Calculate end_date based on start_date and duration
    end_date = start_date + duration.days

    # Check if there are overlapping bookings for the same car
    overlapping_bookings = Booking.where(car_id: car_id)
                                  .where.not(id: id) # Exclude the current booking from the check
                                  .where('start_date < ? AND (start_date + duration) > ?', end_date, start_date)

    if overlapping_bookings.exists?
      errors.add(:start_date, "is not available for the selected duration.")
    end
  end
end
