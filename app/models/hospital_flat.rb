class HospitalFlat < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  has_many :flats
end
