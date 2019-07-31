class Painting < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 300}
  validates :category, :price, presence: true
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings
end
