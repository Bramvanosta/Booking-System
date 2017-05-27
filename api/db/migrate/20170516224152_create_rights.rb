class CreateRights < ActiveRecord::Migration[5.1]
  def change
    create_table :rights do |t|
      t.references :user, foreign_key: true
      t.references :campground, foreign_key: true

      # Here go the different access rights
      t.boolean :can_view_bookings, null: false, default: true
      t.boolean :can_edit_bookings, null: false, default: false

      t.timestamps
    end
  end
end
