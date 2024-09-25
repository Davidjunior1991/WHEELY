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
  'Model S' => 'https://images.unsplash.com/photo-1519440862171-af26cf8c2a85?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'Civic' => 'https://images.unsplash.com/photo-1519440862171-af26cf8c2a85?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'F-150' => 'https://images.unsplash.com/photo-1519440862171-af26cf8c2a85?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'Corolla' => 'https://images.unsplash.com/photo-1519440862171-af26cf8c2a85?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'Charger' => 'https://images.unsplash.com/photo-1519440862171-af26cf8c2a85?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
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
