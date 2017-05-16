class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.references :rental_category, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
