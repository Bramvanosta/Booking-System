class CreateBookingHasPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :booking_has_people do |t|
      t.references :booking, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
