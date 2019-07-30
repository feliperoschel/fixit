class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :painting
  validates :total_price, :start_date, :end_date, :location, presence: true

end
