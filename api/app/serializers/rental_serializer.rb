class RentalSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :rental_category
end
