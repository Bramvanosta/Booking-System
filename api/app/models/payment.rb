# == Schema Information
#
# Table name: payments
#
#  id             :integer          not null, primary key
#  booking_id     :integer
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("EUR"), not null
#  method         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Payment < ApplicationRecord

  # == Monetize
  monetize :price_cents

  # == Associations
  belongs_to :booking

end
