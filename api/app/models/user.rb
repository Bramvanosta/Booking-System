# == Schema Information
#
# Table name: userstrue
#
#  id                     :integer          not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  first_name             :string           not null
#  last_name              :string           not null
#  email                  :string           not null
#  tokens                 :json
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord

  # == Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  # == Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
            uniqueness: true

  # == Associations
  has_many :rights
  has_many :api_keys

  has_many :campgrounds, through: :rights

end
