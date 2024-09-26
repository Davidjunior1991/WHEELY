# db/seeds.rb
require 'open-uri'

# Clear existing records
Booking.destroy_all
Car.destroy_all
User.destroy_all

# Create Users
users = User.create!([
  { email: 'david@example.com', password: 'password123' },
  { email: 'darian@example.com', password: 'password123' },
  { email: 'ndi@example.com', password: 'password123' }
])
puts "Users are created"

# Define image URLs
image_urls = {
  'Model S' => 'https://s1.cdn.autoevolution.com/images/gallery/TESLA-MOTORS-Model-S-4693_74.jpg',
  'Civic' => 'https://s3-ap-southeast-1.amazonaws.com/motoristprod/editors/images/1684977200590-civicfd-1_52916231072_o.jpg',
  'F-150' => 'https://images.hgmsites.net/hug/2018-ford-f-150_100650676_h.jpg',
  'Corolla' => 'https://fotos.perfil.com/2022/06/03/toyota-corolla-1366408.jpg',
  'Charger' => 'https://www.edmunds.com/assets/m/cs/bltf884680096ae8ddd/6393e547bed42e2d4903d5be/2023_Dodge_Charger_Scat_Pack_White_Front_Quarter_View_1600.jpg'
}

# Create Cars
cars = Car.create!([
  { name: 'Model S', brand: 'Tesla', price_per_day: 200.0, category: 'Electric', user: users[0] },
  { name: 'Civic', brand: 'Honda', price_per_day: 50.0, category: 'Sedan', user: users[1] },
  { name: 'F-150', brand: 'Ford', price_per_day: 70.0, category: 'Truck', user: users[2] },
  { name: 'Corolla', brand: 'Toyota', price_per_day: 40.0, category: 'Sedan', user: users[0] },
  { name: 'Charger', brand: 'Dodge', price_per_day: 90.0, category: 'Muscle', user: users[1] }
])
puts "Cars are created"

# Attach photos to cars
cars.each do |car|
  car.photo.attach(io: URI.open(image_urls[car.name]), filename: "#{car.name.downcase}.jpg", content_type: 'image/jpg')
end
puts "Photos are attached to cars"

# Create Bookings
Booking.create!([
  { date: '2024-09-25', duration: 3, status: 0, user: users[0], car: cars[0] },
  { date: '2024-09-26', duration: 5, status: 1, user: users[1], car: cars[1] },
  { date: '2024-09-28', duration: 2, status: 0, user: users[2], car: cars[2] },
  { date: '2024-10-01', duration: 4, status: 1, user: users[0], car: cars[3] },
  { date: '2024-10-05', duration: 1, status: 0, user: users[1], car: cars[4] }
])

puts "Seed data created successfully!"
