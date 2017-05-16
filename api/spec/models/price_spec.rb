# == Schema Information
#
# Table name: prices
#
#  id                 :integer          not null, primary key
#  season_id          :integer
#  rental_category_id :integer
#  price_cents        :integer          default("0"), not null
#  price_currency     :string           default("USD"), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe Price, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
