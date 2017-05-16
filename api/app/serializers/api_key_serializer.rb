class ApiKeySerializer < ActiveModel::Serializer
  attributes :id, :key, :name
  has_one :user
  has_one :campground
end
