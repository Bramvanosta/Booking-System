# == Schema Information
#
# Table name: rentals
#
#  id                 :integer          not null, primary key
#  rental_category_id :integer
#  name               :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Rental < ApplicationRecord
  belongs_to :rental_category
end
