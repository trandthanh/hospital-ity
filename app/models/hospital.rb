class Hospital < ApplicationRecord
  has_many :hospital_flats
  has_many :users
end
