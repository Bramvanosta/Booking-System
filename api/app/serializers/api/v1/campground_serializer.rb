module Api::V1
  class CampgroundSerializer < ActiveModel::Serializer
    attributes :id,
               :name,
               :address,
               :zip_code,
               :city,
               :country,
               :longitude,
               :latitude,
               :logo_url,
               :website_url,
               :phone_number,
               :mobile_number,
               :currency
  end
end
