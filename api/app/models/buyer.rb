# == Schema Information
#
# Table name: buyers
#
#  id            :integer          not null, primary key
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

class Buyer < ApplicationRecord

  # == Validations
  validates :title,         presence: { message: 'Title can not be empty' }
  validates :first_name,    presence: { message: 'First Name can not be empty' }
  validates :last_name,     presence: { message: 'Last Name can not be empty' }
  validates :email,         presence: { message: 'Email can not be empty' }
  validates :address,       presence: { message: 'Address can not be empty' }
  validates :zip_code,      presence: { message: 'Zip code can not be empty' }
  validates :city,          presence: { message: 'City can not be empty' }
  validates :country,       presence: { message: 'Country can not be empty' }
  validates :phone_number,  presence: { message: 'Phone number can not be empty' }

  # == Associations
  has_many :bookings
  has_many :persons

end
