class CreateApiKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys do |t|
      t.references :user, foreign_key: true
      t.references :campground, foreign_key: true
      t.string :key, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
