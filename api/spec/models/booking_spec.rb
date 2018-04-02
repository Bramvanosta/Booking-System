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
# Indexes
#
#  index_bookings_on_campground_id  (campground_id)
#  index_bookings_on_client_id      (client_id)
#
# Foreign Keys
#
#  fk_rails_...  (campground_id => campgrounds.id)
#  fk_rails_...  (client_id => clients.id)
#

require 'rails_helper'

RSpec.describe Booking, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
