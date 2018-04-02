# == Schema Information
#
# Table name: booking_has_rentals
#
#  id         :integer          not null, primary key
#  booking_id :integer
#  rental_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_booking_has_rentals_on_booking_id  (booking_id)
#  index_booking_has_rentals_on_rental_id   (rental_id)
#
# Foreign Keys
#
#  fk_rails_...  (booking_id => bookings.id)
#  fk_rails_...  (rental_id => rentals.id)
#

class BookingHasRental < ApplicationRecord

  # == Associations
  belongs_to :booking
  belongs_to :rental

end
