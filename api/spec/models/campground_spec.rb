# == Schema Information
#
# Table name: campgrounds
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  address       :string           not null
#  zip_code      :string           not null
#  city          :string           not null
#  country       :string           not null
#  longitude     :float            not null
#  latitude      :float            not null
#  logo_url      :string
#  website_url   :string
#  phone_number  :string
#  mobile_number :string
#  currency      :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Campground, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
