class Painting < ApplicationRecord
  validates :title, presence: true, length {maximum: 50}
  validates :description, presence: true, length {maximum: 300}
  validates :category, presence: true
  validates :price, presence: true

  belongs_to :user
end
