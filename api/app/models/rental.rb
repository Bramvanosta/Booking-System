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
# Indexes
#
#  index_rentals_on_rental_category_id  (rental_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (rental_category_id => rental_categories.id)
#

class Rental < ApplicationRecord

  # == Validations
  validates :name, presence: true

  # == Associations
  belongs_to :rental_category

  has_many :booking_has_rentals

  has_many :bookings, through: :booking_has_rentals

end
