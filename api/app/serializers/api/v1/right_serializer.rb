module Api::V1
  class RightSerializer < ActiveModel::Serializer
    attributes :id,
               :can_view_bookings,
               :can_edit_bookings
  end
end
