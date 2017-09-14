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

require 'rails_helper'

RSpec.describe Price, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
