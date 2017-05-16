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

require 'rails_helper'

RSpec.describe BookingHasRental, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
