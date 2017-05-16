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

class Price < ApplicationRecord
  belongs_to :season
  belongs_to :rental_category
end
