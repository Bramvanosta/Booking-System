module Api::V1
  class RightSerializer < ActiveModel::Serializer
    attributes :can_view_rights,
               :can_edit_rights,
               :can_view_campground,
               :can_edit_campground,
               :can_view_bookings,
               :can_edit_bookings,
               :can_create_bookings,
               :can_delete_bookings,
               :can_view_clients,
               :can_edit_clients,
               :can_delete_clients,
               :can_view_api_keys,
               :can_create_api_keys,
               :can_edit_api_keys,
               :can_delete_api_keys,
               :can_view_users,
               :can_create_users,
               :can_edit_users,
               :can_delete_users
  end
end
