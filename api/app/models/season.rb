# == Schema Information
#
# Table name: seasons
#
#  id            :integer          not null, primary key
#  campground_id :integer
#  name          :string           not null
#  start_date    :date             not null
#  end_date      :date             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Season < ApplicationRecord
  belongs_to :campground
end
