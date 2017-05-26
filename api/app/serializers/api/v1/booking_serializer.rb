module Api::V1
  class BookingSerializer < ActiveModel::Serializer
    attributes :id,
               :status,
               :arrival_date,
               :departure_date

    has_one :client

    has_many :rentals
    has_many :persons
    has_many :payments
  end
end
