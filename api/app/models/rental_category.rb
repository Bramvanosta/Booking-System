# == Schema Information
#
# Table name: rental_categories
#
#  id            :integer          not null, primary key
#  campground_id :integer
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class RentalCategory < ApplicationRecord

  # == Validations
  validates :name, presence: { message: 'Name can not be empty' }

  # == Associations
  belongs_to :campground
  has_many :seasons, through: :prices
  has_many :rentals

end
