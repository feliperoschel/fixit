class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :paintings

  validates :total_price, :start_date, :start_date, :location, :time, presence: true
end
