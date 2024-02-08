# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all

all_dogs = []
all_dog_sitters = []
all_cities = []
all_stroll = []

5.times do #Create 5 city with Faker generator
  all_cities << City.create(city_name: Faker::Address.city)
end

30.times do #Create 30 dogs with Faker generator with a random city
  random_city = all_cities.sample
  all_dogs << Dog.create(name: Faker::FunnyName.name, city: random_city)
end

10.times do #Create 10 dog sitters with Faker generator and a random city.
  random_city = all_cities.sample
  all_dog_sitters << Dogsitter.create(name: Faker::Name.name, city: random_city)
end

all_dogs.each do |dog| #For all dog, create a Stroll with a dog, a dog sitter and the city of the dog sitter.
  random_sitter = all_dog_sitters.sample

  all_stroll << Stroll.create(dog: dog, dogsitter: random_sitter, city: random_sitter.city)
end

