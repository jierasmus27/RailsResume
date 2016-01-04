class InstitutionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at
  has_many :instructors, serializer: InstructorSerializer
end
