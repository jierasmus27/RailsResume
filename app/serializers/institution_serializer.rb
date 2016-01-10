class InstitutionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :instructors, :parent, :created_at

  def instructors
    object.instructors.map do |instructor|
      {"id" => instructor.id, "name" => instructor.name}
    end
  end

  def parent
    return {} if object.parent.nil?
    {"id" => object.parent.id, "name" => object.parent.name}
  end
end
