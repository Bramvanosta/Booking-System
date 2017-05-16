class CreateBookingHasRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_has_rentals do |t|
      t.references :booking, foreign_key: true
      t.references :rental, foreign_key: true

      t.timestamps
    end
  end
end
