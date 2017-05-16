class BookingSerializer < ActiveModel::Serializer
  attributes :id, :status, :arrival_time, :departure_time
  has_one :campground
  has_one :buyer
end
