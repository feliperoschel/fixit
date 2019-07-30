# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


Review.delete_all if Rails.env.development?
Painting.delete_all if Rails.env.development?
Booking.delete_all if Rails.env.development?
User.delete_all if Rails.env.development?



20.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    # phone_number: Faker::PhoneNumber.cell_phone,
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



20.times do
  user = User.all.sample
  start_date = Faker::Date.forward(23)
  end_date = start_date + rand(1..10)
  painting = Painting.all.sample
  booking = Booking.create!(
    start_date: start_date,
    end_date: end_date,
    total_price: (end_date - start_date) * painting.price,
    location: Faker::Address.full_address,
    time: Time.now,
    user: user,
    painting: painting
    )
end

Painting.all.each do |painting|
  rand(3..5).times do
   review = Review.new(
      painting: painting,
      date: Faker::Date.forward(23),
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.sentences,
      rating: rand(0..5)
    )
   review.save
  end
end