# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: ‘Star Wars’ }, { name: ‘Lord of the Rings’ }])
#   Character.create(name: ‘Luke’, movie: movies.first)

categories = ['Impressionism','Renaissance','Modern','Baroque','Romanticism','Rococo','Realism',
              'Expressionism','Mannerism','Neoclassicism','Pop Art','Abstract','Surrealism',
              'Cubism','Contemporary','Futurism','Minimalism']

images = [
  'https://images.unsplash.com/photo-1541961017774-22349e4a1262?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1544867885-2333f61544ad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1524664399170-77e7118fdb6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1531913764164-f85c52e6e654?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1555420087-62ca236e0256?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1306&q=80',
  'https://images.unsplash.com/photo-1563283619-0f960c4b38fe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1533158388470-9a56699990c6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1533158326339-7f3cf2404354?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=808&q=80',
  'https://images.unsplash.com/photo-1531132076534-0120b6aa12cd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1538935118162-fa31d31b48a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'
]

Review.delete_all if Rails.env.development?
Booking.delete_all if Rails.env.development?
Painting.delete_all if Rails.env.development?
User.delete_all if Rails.env.development?

10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
  password: '123456')
  user.save!
end

index = -1
User.all.each do |user|
  index += 1
  painting = Painting.new(
    title: Faker::Book.title,
    description: Faker::Commerce.product_name,
    category: Faker::Book.genre,
    price: Faker::Commerce.price,
    location: Faker::Address.city,
    user: user
  )
  painting.remote_photo_url = images[index]
  painting.tag_list.add(categories.sample(3))
  painting.save!
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
      content: Faker::Quote.matz,
      rating: rand(0..5)
    )
    review.save!
  end
end
