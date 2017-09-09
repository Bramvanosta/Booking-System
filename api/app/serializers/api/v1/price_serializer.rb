module Api::V1
  class PriceSerializer < ActiveModel::Serializer
    attributes :id,
               :name,
               :price_cents,
               :price_currency
  end
end
