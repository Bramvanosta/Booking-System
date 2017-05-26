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

class BookingHasRental < ApplicationRecord

  # == Associations
  belongs_to :booking
  belongs_to :rental

end
