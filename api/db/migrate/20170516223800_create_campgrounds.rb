class CreateCampgrounds < ActiveRecord::Migration[5.1]
  def change
    create_table :campgrounds do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :zip_code, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.string :logo_url
      t.string :website_url
      t.string :phone_number
      t.string :mobile_number
      t.string :currency, null: false

      t.timestamps
    end
  end
end
