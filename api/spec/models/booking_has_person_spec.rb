# == Schema Information
#
# Table name: booking_has_people
#
#  id         :integer          not null, primary key
#  booking_id :integer
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_booking_has_people_on_booking_id  (booking_id)
#  index_booking_has_people_on_person_id   (person_id)
#
# Foreign Keys
#
#  fk_rails_...  (booking_id => bookings.id)
#  fk_rails_...  (person_id => people.id)
#

require 'rails_helper'

RSpec.describe BookingHasPerson, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
