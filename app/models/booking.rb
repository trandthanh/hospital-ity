class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat, counter_cache: true

  validates :arrival, :departure, presence: true, availability: true
  validate :departure_after_arrival

  # def self.between(starts_at, ends_at)
  #   where(
  #    '? BETWEEN bookings.arrival AND bookings.departure',
  #    starts_at
  #   )
  # end

  def booking_days
    (departure - arrival).to_i
  end

  private

  def departure_after_arrival
    return if departure.blank? || arrival.blank?

    if departure < arrival
      errors.add(:departure, "doit être après l'arrivée")
    end
  end
end



