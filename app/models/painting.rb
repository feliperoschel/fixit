class Painting < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :title, presence: true

  belongs_to :user
end
