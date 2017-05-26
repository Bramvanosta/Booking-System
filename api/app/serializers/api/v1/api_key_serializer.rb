module Api::V1
  class ApiKeySerializer < ActiveModel::Serializer
    attributes :id,
               :name,
               :token,
               :can_view_bookings,
               :can_edit_bookings
  end
end
