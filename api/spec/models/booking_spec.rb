# == Schema Information
#
# Table name: bookings
#
#  id             :integer          not null, primary key
#  campground_id  :integer
#  client_id      :integer
#  status         :string           default("created")
#  arrival_date   :date             not null
#  departure_date :date             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Booking, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
