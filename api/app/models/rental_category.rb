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
# Indexes
#
#  index_rental_categories_on_campground_id  (campground_id)
#
# Foreign Keys
#
#  fk_rails_...  (campground_id => campgrounds.id)
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
