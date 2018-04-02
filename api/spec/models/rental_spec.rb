# == Schema Information
#
# Table name: rentals
#
#  id                 :integer          not null, primary key
#  rental_category_id :integer
#  name               :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_rentals_on_rental_category_id  (rental_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (rental_category_id => rental_categories.id)
#

require 'rails_helper'

RSpec.describe Rental, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
