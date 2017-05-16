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

require 'rails_helper'

RSpec.describe RentalCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
