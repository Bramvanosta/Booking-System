# == Schema Information
#
# Table name: api_keys
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  campground_id     :integer
#  token             :string           not null
#  name              :string           not null
#  can_view_bookings :boolean          default(TRUE), not null
#  can_edit_bookings :boolean          default(FALSE), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_api_keys_on_campground_id  (campground_id)
#  index_api_keys_on_token          (token) UNIQUE
#  index_api_keys_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (campground_id => campgrounds.id)
#  fk_rails_...  (user_id => users.id)
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
