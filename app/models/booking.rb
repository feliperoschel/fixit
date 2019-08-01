class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :painting
  validates :start_date, :end_date, :location, presence: true
  validate :start_must_be_before_end_date

  private

  def start_must_be_before_end_date
    errors.add(:end_date, "must be after start date") unless
    end_date > start_date
  end
end
