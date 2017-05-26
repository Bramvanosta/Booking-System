class BookingSerializer < ActiveModel::Serializer
  attributes :id, :status, :arrival_date, :departure_date

  has_one :campground
  has_one :client
end
