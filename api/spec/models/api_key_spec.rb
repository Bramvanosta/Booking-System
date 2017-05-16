# == Schema Information
#
# Table name: api_keys
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  campground_id :integer
#  key           :string           not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
