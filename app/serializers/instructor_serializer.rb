class InstructorSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :instittion, :created_at

  def instittion
    #return {} if parent.nil?
    {"id" => object.institution.id, "name" => object.institution.name}
  end
end
