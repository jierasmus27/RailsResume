class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url
  has_one :instructor
end
