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

class Right < ApplicationRecord
  belongs_to :user
  belongs_to :campground
end
