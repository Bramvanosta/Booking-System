# == Schema Information
#
# Table name: rental_categories
#
#  id            :integer          not null, primary key
#  campground_id :integer
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class RentalCategory < ApplicationRecord
  belongs_to :campground
end
