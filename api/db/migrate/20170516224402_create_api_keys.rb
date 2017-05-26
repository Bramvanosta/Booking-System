class CreateApiKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys do |t|
      t.references :user, foreign_key: true
      t.references :campground, foreign_key: true
      t.string :token, null: false
      t.string :name, null: false

      # Here go the different access rights
      t.string :can_view_bookings, default: true
      t.string :can_edit_bookings, default: false

      t.timestamps
    end

    add_index :api_keys, [:token], :unique => true
  end
end
