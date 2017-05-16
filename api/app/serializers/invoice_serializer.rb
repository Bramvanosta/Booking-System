class InvoiceSerializer < ActiveModel::Serializer
  attributes :id
  has_one :booking
  has_one :payment
end
