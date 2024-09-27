class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :brand, presence: true
  validates :price_per_day, presence: true
  validates :category, presence: true
  has_one_attached :photo
  has_one_attached :image
  has_many :ratings, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_brand_and_category,
                  against: [ :name, :brand, :category ],
                  using: { tsearch: { prefix: true } }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_rating
    average = 0
    ratings.each do |rating|
      average += rating.score
    end
    return average.fdiv(ratings.count)
  end
  def unavailable_dates
    bookings.map do |booking|
      {
        from: booking.date,
        to: booking.date + booking.duration.days
      }
    end

  end
end
