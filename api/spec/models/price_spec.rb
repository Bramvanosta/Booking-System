# == Schema Information
#
# Table name: prices
#
#  id                 :integer          not null, primary key
#  season_id          :integer
#  rental_category_id :integer
#  name               :string           not null
#  price_cents        :integer          default(0), not null
#  price_currency     :string           default("EUR"), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_prices_on_rental_category_id  (rental_category_id)
#  index_prices_on_season_id           (season_id)
#
# Foreign Keys
#
#  fk_rails_...  (rental_category_id => rental_categories.id)
#  fk_rails_...  (season_id => seasons.id)
#

require 'rails_helper'

RSpec.describe Price, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
