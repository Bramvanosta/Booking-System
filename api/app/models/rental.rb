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

  # == Validations
  validates :name, presence: {message: 'Name can not be empty'}

  # == Associations
  belongs_to :rental_category
  has_many :bookings, through: :booking_has_rentals

end
