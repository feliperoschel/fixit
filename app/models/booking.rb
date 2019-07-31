class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :painting
  validates :start_date, :end_date, :location, presence: true
end
