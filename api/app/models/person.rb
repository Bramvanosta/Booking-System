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

  # == Validations
  validates :birth_date, presence: { message: 'Birth date can not be empty' }

  # == Associations
  belongs_to :buyer

end
