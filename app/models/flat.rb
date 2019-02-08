class Flat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  belongs_to :user
  belongs_to :hospital

  has_many :bookings
  has_many :reviews
  has_many :photos
  has_many :hospital_flats

  validates :photo, presence: true
  validates :photos, length: { maximum: 6 }


  def unavailable_dates
    bookings.pluck(:arrival, :departure).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end


