# == Schema Information
#
# Table name: bookings
#
#  id             :integer          not null, primary key
#  campground_id  :integer
#  buyer_id       :integer
#  status         :string           default("created")
#  arrival_date   :date             not null
#  departure_date :date             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Booking < ApplicationRecord

  # == Validations
  validates :arrival_date, presence: {message: 'Arrival date can not be empty'},
            in_future: {message: 'Arrival date can not be in the past'}
  validates :departure_date, presence: {message: 'Departure date can not be empty'},
            in_future: {message: 'Departure date can not be in the past'}
  validate :departure_after_arrival

  # == Associations
  belongs_to :campground
  belongs_to :buyer
  has_many :rentals, through: :booking_has_rentals
  has_many :persons, through: :booking_has_persons
  has_many :payments

  # == Functions
  def departure_after_arrival
    if departure_date < arrival_date
      errors.add(:date_departure, 'Departure date can not be before Arrival date')
    end
  end

end
