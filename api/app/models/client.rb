# == Schema Information
#
# Table name: clients
#
#  id            :integer          not null, primary key
#  campground_id :integer
#  title         :string           not null
#  first_name    :string           not null
#  last_name     :string           not null
#  email         :string           not null
#  address       :string           not null
#  zip_code      :string           not null
#  city          :string           not null
#  country       :string           not null
#  phone_number  :string           not null
#  mobile_number :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Client < ApplicationRecord

  # == Validations
  validates :title, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :phone_number, presence: true

  # == Associations
  has_many :bookings
  has_many :persons

  belongs_to :campground

end
