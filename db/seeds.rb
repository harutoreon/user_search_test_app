100.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  User.create!(name: name, email: email)
end