class InstitutionViewSerializer < ActiveModel::Serializer
  root :institution
  attributes :id, :name
end
