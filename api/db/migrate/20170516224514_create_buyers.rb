class CreateBuyers < ActiveRecord::Migration[5.1]
  def change
    create_table :buyers do |t|
      t.string :title, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :address, null: false
      t.string :zip_code, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.string :phone_number, null: false
      t.string :mobile_number

      t.timestamps
    end
  end
end
