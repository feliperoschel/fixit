# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.delete_all if Rails.env.development?


20.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    password: "123456")
  user.save
end

User.all.each do |user|
 painting = Painting.new(
  title: Faker::Book.title,
  description: Faker::Commerce.product_name,
  category: Faker::Book.genre,
  price: Faker::Commerce.price ,
  photo: "" ,
  location: Faker::Address.city,
  user: user)
  painting.save
end





