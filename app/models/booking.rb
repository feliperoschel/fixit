class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :painting
  validates :start_date, :end_date, :location, :time, presence: true

end
