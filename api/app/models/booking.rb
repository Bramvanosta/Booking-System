# == Schema Information
#
# Table name: bookings
#
#  id             :integer          not null, primary key
#  campground_id  :integer
#  client_id      :integer
#  status         :string           default("created")
#  arrival_date   :date             not null
#  departure_date :date             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_bookings_on_campground_id  (campground_id)
#  index_bookings_on_client_id      (client_id)
#
# Foreign Keys
#
#  fk_rails_...  (campground_id => campgrounds.id)
#  fk_rails_...  (client_id => clients.id)
#

class Booking < ApplicationRecord

  # == Validations
  validates :arrival_date, presence: true,
            in_future: {message: :future}
  validates :departure_date, presence: true,
            in_future: {message: :future}
  validate :departure_after_arrival

  # == Associations
  belongs_to :campground
  belongs_to :client

  has_many :booking_has_rentals
  has_many :booking_has_persons
  has_many :payments

  has_many :rentals, through: :booking_has_rentals
  has_many :persons, through: :booking_has_persons

  # == Functions
  def departure_after_arrival
    if departure_date < arrival_date
      errors.add(:date_departure, :before_arrival)
    end
  end

end
