class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :brand, presence: true
  validates :price_per_day, presence: true
  validates :category, presence: true
  has_one_attached :photo
  has_one_attached :image
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def unavailable_dates
    bookings.map do |booking|
      {
        from: booking.start_date,
        to: booking.start_date + booking.duration.days
      }
    end
  end
end
