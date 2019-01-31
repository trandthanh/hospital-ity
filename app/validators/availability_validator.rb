class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    bookings = Booking.where(["flat_id =?", record.flat_id])
    date_ranges = bookings.map { |b| b.arrival..b.departure }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "non disponible")
      end
    end
  end

end
