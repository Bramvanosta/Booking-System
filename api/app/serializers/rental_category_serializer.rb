class RentalCategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :campground
end
