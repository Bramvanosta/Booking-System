class PriceSerializer < ActiveModel::Serializer
  attributes :id, :price
  has_one :season
  has_one :rental_category
end
