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
    end_date = date + duration.days

    overlapping_bookings = Booking.where(car_id: car_id)
                                  .where.not(id: id)
                                  .where('date < ? AND (date + duration) > ?', end_date, date)

    if overlapping_bookings.exists?
      errors.add(:date, "is not available for the selected duration.")
    end
  end
end
