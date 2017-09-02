class AddCampgroundToClient < ActiveRecord::Migration[5.1]
  def change
    add_reference :clients, :campground, index: true
  end
end
