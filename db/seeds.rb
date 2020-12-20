User.destroy_all
puts "Creating Bruce..."
bruce = User.create(
  name: 'Bruce',
  email: 'b@t.man',
  password: '123456'
)
puts "Bruce created!"

puts "Clearing restaurants..."
Restaurant.destroy_all
puts "Clear!"
i = 1
20.times do 
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    cuisine: %w[Italian Lebanese Japanese Belgian French Chinese].sample,
    address: Faker::Address.full_address,
    average_price: (15..50).to_a.sample.to_f,
    user: bruce
  )
  puts "#{i}. #{restaurant.name} successfully created!"
  i += 1
end
puts "Seeding complete!"