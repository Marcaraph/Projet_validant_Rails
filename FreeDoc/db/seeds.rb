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

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all

all_zip = ["75001", "75002", "75003", "75004", "75005", "75006", "75007", "75008", "75009", "75010", "75011", "75012"]
all_specialties = ["Cardiologie", "Dermatologie", "Gastro-entérologie", "Gynécologie", "Neurologie"]

all_cities = []
all_doctors = []
all_patients = []
all_appointments = []
all_profession = []

# Génère 5 villes
5.times do
  all_cities << City.create(name: Faker::Address.city)
end

# Génère 20 patients
20.times do
  all_patients << Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: all_cities.sample)
end

all_specialties.each do |specialty|
  all_profession << Specialty.create(specialty_name: specialty)
end

# Génère 10 docteurs
10.times do
  all_doctors << Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialty: all_profession.sample, zip_code: all_zip.sample, city: all_cities.sample)
end

# Génère des RDVs

all_patients.each do |patient|
  random_doctor = all_doctors.sample
  all_appointments << Appointment.create(patient: patient, doctor: random_doctor, city: random_doctor.city)
end





# # # Génère des villes
# # cities = 5.times.map do
# #   City.create(name: Faker::Address.city)
# # end

# # Génère des spécialités
# specialties = 10.times.map do
#   Specialty.create(name: Faker::Lorem.word)
# end

# # Génère 7 docteurs avec des spécialités
# doctors = 7.times.map do
#   city = cities.sample
#   doctor = Doctor.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     zip_code: Faker::Address.zip_code,
#     city: city
#   )
#   doctor.specialties << specialties.sample(rand(1..3))
#   doctor
# end

# # Genère 20 patients
# patients = 20.times.map do
#   city = cities.sample
#   patient = Patient.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     city: city
#   )
#   patients
# end

# # Génère des RDVs pour chaque patient et chaque docteur
# patients.each do |patient|
#   city = cities.sample
#   doctor = doctors.sample
#   appointment = Appointment.create(
#     date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30),
#     doctor: doctor,
#     patient: patient,
#     city: city
#   )
# end
