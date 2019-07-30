class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :painting
  has_many :reviews
  validates :total_price, :start_date, :end_date, :location, :time, presence: true
end
