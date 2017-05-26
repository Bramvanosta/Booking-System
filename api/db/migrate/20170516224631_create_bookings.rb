class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :campground, foreign_key: true
      t.references :client, foreign_key: true
      t.string :status, default: 'created'
      t.date :arrival_date, null: false
      t.date :departure_date, null: false

      t.timestamps
    end
  end
end
