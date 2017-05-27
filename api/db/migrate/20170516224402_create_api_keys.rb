class CreateApiKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys do |t|
      t.references :user, foreign_key: true
      t.references :campground, foreign_key: true
      t.string :token, null: false
      t.string :name, null: false

      # Here go the different access rights
      t.boolean :can_view_bookings, null: false, default: true
      t.boolean :can_edit_bookings, null: false, default: false

      t.timestamps
    end

    add_index :api_keys, [:token], :unique => true
  end
end
