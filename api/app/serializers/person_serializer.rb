class PersonSerializer < ActiveModel::Serializer
  attributes :id, :birth_time
  has_one :buyer
end
