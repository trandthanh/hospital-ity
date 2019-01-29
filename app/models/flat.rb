class Flat < ApplicationRecord
  belongs_to :user
  belongs_to :hospital

  has_many :bookings
  has_many :reviews
  has_many :photos
  has_many :hospital_flats
end
