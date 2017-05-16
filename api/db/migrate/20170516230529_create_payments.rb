class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :booking, foreign_key: true
      t.monetize :price
      t.string :method

      t.timestamps
    end
  end
end
