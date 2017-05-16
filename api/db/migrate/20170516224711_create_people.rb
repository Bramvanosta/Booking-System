class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.references :buyer, foreign_key: true
      t.date :birth_date, null: false

      t.timestamps
    end
  end
end
