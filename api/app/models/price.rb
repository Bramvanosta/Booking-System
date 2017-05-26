# == Schema Information
#
# Table name: prices
#
#  id                 :integer          not null, primary key
#  season_id          :integer
#  rental_category_id :integer
#  name               :string           not null
#  price_cents        :integer          default("0"), not null
#  price_currency     :string           default("EUR"), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Price < ApplicationRecord

  # == Validations
  validates :name, presence: {message: 'Name can not be empty'}
  validates :price_cents, presence: {message: 'Price can not be empty'}

  # == Associations
  belongs_to :season
  belongs_to :rental_category

end
