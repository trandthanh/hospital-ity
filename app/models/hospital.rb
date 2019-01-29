class Hospital < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :hospital_flats
  has_many :users
  has_many :codes
  has_many :flats, through: :users
end
