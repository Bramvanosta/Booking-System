# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  client_id  :integer
#  birth_date :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_people_on_client_id  (client_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#

class Person < ApplicationRecord

  # == Validations
  validates :birth_date, presence: true

  # == Associations
  belongs_to :client

end
