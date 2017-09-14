# == Schema Information
#
# Table name: rights
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  campground_id       :integer
#  can_view_bookings   :boolean          default(TRUE), not null
#  can_edit_bookings   :boolean          default(FALSE), not null
#  can_view_rights     :boolean          default(TRUE), not null
#  can_edit_rights     :boolean          default(FALSE), not null
#  can_view_campground :boolean          default(TRUE), not null
#  can_edit_campground :boolean          default(FALSE), not null
#  can_create_bookings :boolean          default(FALSE), not null
#  can_delete_bookings :boolean          default(FALSE), not null
#  can_view_clients    :boolean          default(TRUE), not null
#  can_edit_clients    :boolean          default(FALSE), not null
#  can_delete_clients  :boolean          default(FALSE), not null
#  can_view_api_keys   :boolean          default(FALSE), not null
#  can_create_api_keys :boolean          default(FALSE), not null
#  can_edit_api_keys   :boolean          default(FALSE), not null
#  can_delete_api_keys :boolean          default(FALSE), not null
#  can_view_users      :boolean          default(FALSE), not null
#  can_create_users    :boolean          default(FALSE), not null
#  can_edit_users      :boolean          default(FALSE), not null
#  can_delete_users    :boolean          default(FALSE), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Right < ApplicationRecord

  # == Associations
  belongs_to :user
  belongs_to :campground

end
