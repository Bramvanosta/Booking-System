# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  email      :string           not null
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  # == Validations
  validates :first_name,  presence: { message: 'First name can not be empty' }
  validates :last_name,   presence: { message: 'Last name can not be empty' }
  validates :email,       presence: { message: 'Email can not be empty' },
                          uniqueness: { message: ->(object, data) do
                            "The email address #{data[:value]} has already been taken, please login or use another email address"
                          end }
  validates :password,    presence: { message: 'Password name can not be empty' }

  # == Associations
  has_many :campgrounds, through: :rights
  has_many :api_keys

end
