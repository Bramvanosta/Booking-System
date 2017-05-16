# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  buyer_id   :integer
#  birth_date :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ApplicationRecord
  belongs_to :buyer
end
