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
end
