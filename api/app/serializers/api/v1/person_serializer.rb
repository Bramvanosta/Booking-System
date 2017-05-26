module Api::V1
  class PersonSerializer < ActiveModel::Serializer
    attributes :id,
               :birth_date
  end
end
