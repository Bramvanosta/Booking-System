module Api::V1
  class RentalCategorySerializer < ActiveModel::Serializer
    attributes :id,
               :name
  end
end
