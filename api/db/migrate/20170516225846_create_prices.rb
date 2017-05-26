class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.references :season, foreign_key: true
      t.references :rental_category, foreign_key: true
      t.string :name, null: false
      t.monetize :price, null: false

      t.timestamps
    end
  end
end
