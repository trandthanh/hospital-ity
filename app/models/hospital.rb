class Hospital < ApplicationRecord
  has_many :hospital_flats
  has_many :users
  has_many :codes
  has_many :flats, through: :users
end
