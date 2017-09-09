module Api::V1
  class RentalSerializer < ActiveModel::Serializer
    attributes :id,
               :name
  end
end
