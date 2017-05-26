# == Schema Information
#
# Table name: seasons
#
#  id            :integer          not null, primary key
#  campground_id :integer
#  name          :string           not null
#  start_date    :date             not null
#  end_date      :date             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Season < ApplicationRecord

  # == Validations
  validates :name, presence: {message: 'Name can not be empty'}
  validates :start_date, presence: {message: 'Start date can not be empty'}
  validates :end_date, presence: {message: 'Start date can not be empty'}
  validate :end_after_start

  # == Associations
  belongs_to :campground

  has_many :prices

  has_many :rental_categories, through: :prices

  # == Functions
  def end_after_start
    if end_date < start_date
      errors.add(:end_date, 'End date can not be before Start date')
    end
  end

end
