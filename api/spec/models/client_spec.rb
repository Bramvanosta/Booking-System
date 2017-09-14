# == Schema Information
#
# Table name: clients
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
#  campground_id :integer
#

require 'rails_helper'

RSpec.describe Client, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
