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

class BookingHasPerson < ApplicationRecord
  belongs_to :booking
  belongs_to :person
end
