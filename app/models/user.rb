class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :paintings, dependent: :destroy
  validates :first_name, :last_name, :email, :password, presence: true
end
