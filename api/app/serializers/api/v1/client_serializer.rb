module Api::V1
  class ClientSerializer < ActiveModel::Serializer
    attributes :id,
               :title,
               :first_name,
               :last_name,
               :email,
               :address,
               :zip_code,
               :city,
               :country,
               :phone_number,
               :mobile_number
  end
end
