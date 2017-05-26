module Api::V1
  class PaymentSerializer < ActiveModel::Serializer
    attributes :id,
               :price_cents,
               :price_currency,
               :method
  end
end
