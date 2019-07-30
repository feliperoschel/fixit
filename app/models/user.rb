class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :paintings
  validates :first_name, :last_name, :email, :password, presence: true
end
