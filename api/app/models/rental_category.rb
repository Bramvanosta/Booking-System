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
  validates :name, presence: true

  # == Associations
  belongs_to :campground

  has_many :rentals
  has_many :prices

  has_many :seasons, through: :prices

end
