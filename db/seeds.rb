
# db/seeds.rb

# Clear existing records
User.destroy_all
Car.destroy_all
Booking.destroy_all

# Create Users
users = User.create!([
  { email: 'david@example.com', password: 'password123' },
  { email: 'darian@example.com', password: 'password123' },
  { email: 'ndi@example.com', password: 'password123' }
])
puts "Users are created"
# Create Cars
cars = Car.create!([
  { name: 'Model S', brand: 'Tesla', price_per_day: 200.0, category: 'Electric', user: users[0]},
  { name: 'Civic', brand: 'Honda', price_per_day: 50.0, category: 'Sedan', user: users[1] },
  { name: 'F-150', brand: 'Ford', price_per_day: 70.0, category: 'Truck', user: users[2] },
  { name: 'Corolla', brand: 'Toyota', price_per_day: 40.0, category: 'Sedan', user: users[0] },
  { name: 'Charger', brand: 'Dodge', price_per_day: 90.0, category: 'Muscle', user: users[1] }
])

# Create Bookings
Booking.create!([
  { date: '2024-09-25', duration: 3, status: 0, user: users[0], car: cars[0] },
  { date: '2024-09-26', duration: 5, status: 1, user: users[1], car: cars[1] },
  { date: '2024-09-28', duration: 2, status: 0, user: users[2], car: cars[2] },
  { date: '2024-10-01', duration: 4, status: 1, user: users[0], car: cars[3] },
  { date: '2024-10-05', duration: 1, status: 0, user: users[1], car: cars[4] }
])

puts "Seed data created successfully!"
