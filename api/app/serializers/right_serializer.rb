class RightSerializer < ActiveModel::Serializer
  attributes :id, :can_view_bookings, :can_edit_bookings
  has_one :user
  has_one :campground
end
