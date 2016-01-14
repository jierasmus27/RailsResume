class InstructorSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :institution, :created_at

  def institution
    #return {} if parent.nil?
    {"id" => object.institution.id, "name" => object.institution.name}
  end
end
