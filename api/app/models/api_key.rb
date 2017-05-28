# == Schema Information
#
# Table name: api_keys
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  campground_id     :integer
#  token             :string           not null
#  name              :string           not null
#  can_view_bookings :boolean          default("true"), not null
#  can_edit_bookings :boolean          default("false"), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class ApiKey < ApplicationRecord

  # == Validations
  validates :name, presence: true

  # == Token
  has_secure_token :token

  # == Associations
  belongs_to :user
  belongs_to :campground

end
