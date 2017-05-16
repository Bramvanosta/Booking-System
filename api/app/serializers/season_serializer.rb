class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_time, :end_time
  has_one :campground
end
