class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat, counter_cache: true

  validates :arrival, :departure, presence: true, availability: true
  validate :departure_after_arrival

  private

  def departure_after_arrival
    return if departure.blank? || arrival.blank?

    if departure < arrival
      errors.add(:departure, "doit être après l'arrivée")
    end
  end
end
