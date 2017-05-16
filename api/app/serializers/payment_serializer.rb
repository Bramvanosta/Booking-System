class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :price, :method
  has_one :booking
end
