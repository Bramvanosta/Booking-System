class AddRightsOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :rights, :can_view_rights, :boolean, null: false, default: true
    add_column :rights, :can_edit_rights, :boolean, null: false, default: false

    add_column :rights, :can_view_campground, :boolean, null: false, default: true
    add_column :rights, :can_edit_campground, :boolean, null: false, default: false

    add_column :rights, :can_create_bookings, :boolean, null: false, default: false
    add_column :rights, :can_delete_bookings, :boolean, null: false, default: false

    add_column :rights, :can_view_clients, :boolean, null: false, default: true
    add_column :rights, :can_edit_clients, :boolean, null: false, default: false
    add_column :rights, :can_delete_clients, :boolean, null: false, default: false

    add_column :rights, :can_view_api_keys, :boolean, null: false, default: false
    add_column :rights, :can_create_api_keys, :boolean, null: false, default: false
    add_column :rights, :can_edit_api_keys, :boolean, null: false, default: false
    add_column :rights, :can_delete_api_keys, :boolean, null: false, default: false

    add_column :rights, :can_view_users, :boolean, null: false, default: false
    add_column :rights, :can_create_users, :boolean, null: false, default: false
    add_column :rights, :can_edit_users, :boolean, null: false, default: false
    add_column :rights, :can_delete_users, :boolean, null: false, default: false
  end
end
