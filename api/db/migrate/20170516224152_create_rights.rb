class CreateRights < ActiveRecord::Migration[5.1]
  def change
    create_table :rights do |t|
      t.references :user, foreign_key: true
      t.references :campground, foreign_key: true
      t.string :can_view_bookings, default: true
      t.string :can_edit_bookings, default: false

      t.timestamps
    end
  end
end
