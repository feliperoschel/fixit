class Painting < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :description, presence: true, length: {maximum: 300}
  validates :category, :price, presence: true
  belongs_to :user
<<<<<<< HEAD
  has_many :reviews
=======
  has_many :reviews, dependent: :destroy
>>>>>>> master
  has_many :bookings
end
