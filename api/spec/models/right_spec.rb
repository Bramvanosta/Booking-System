# == Schema Information
#
# Table name: rights
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  campground_id     :integer
#  can_view_bookings :string           default("t")
#  can_edit_bookings :string           default("f")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Right, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
