class CreateRentalCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :rental_categories do |t|
      t.references :campground, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
