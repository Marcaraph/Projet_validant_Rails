class Doctor < ApplicationRecord
  belongs_to :city
  belongs_to :specialty
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :doctor_specialties
  has_many :specialties, through: :doctor_specialties
end
