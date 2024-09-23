class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :status, presence: true
  validates :duration, presence: true
  validates :date, presence: true


  enum status: { pending: 0, approved: 1, declined: 2 }
end
