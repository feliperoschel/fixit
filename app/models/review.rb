class Review < ApplicationRecord
  belongs_to :painting
  validates :date, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: (0..5) }
end
