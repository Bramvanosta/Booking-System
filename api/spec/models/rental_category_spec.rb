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
# Indexes
#
#  index_rental_categories_on_campground_id  (campground_id)
#
# Foreign Keys
#
#  fk_rails_...  (campground_id => campgrounds.id)
#

require 'rails_helper'

RSpec.describe RentalCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
