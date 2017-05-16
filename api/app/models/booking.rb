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
  belongs_to :campground
  belongs_to :buyer
end
