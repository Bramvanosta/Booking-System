# == Schema Information
#
# Table name: user_has_campgrounds
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  campground_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class UserHasCampground < ApplicationRecord
  belongs_to :user
  belongs_to :campground
end
