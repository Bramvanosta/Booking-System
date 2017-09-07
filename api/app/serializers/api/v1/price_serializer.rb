module Api::V1
  class PriceSerializer < ActiveModel::Serializer
    attributes :id,
               :name,
               :price_cents,
               :price_currency
    
    has_one :season
    has_one :rental_category
  end
end
