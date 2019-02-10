class Flat < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  belongs_to :user
  belongs_to :hospital

  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :hospital_flats, dependent: :destroy

  # validates :photo, presence: true
  validates :photos, length: { maximum: 6 }
  validates :flat_type, inclusion: { in: ["Chambre Privee", "Logement Entier"] }


  def unavailable_dates
    bookings.pluck(:arrival, :departure).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end


