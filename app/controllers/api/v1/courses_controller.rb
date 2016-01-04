class Api::V1::CoursesController < Api::V1::BaseController
  before_action :set_object_from_id, only: [:show, :update]

  def_param_group :id do
    param :id, :number, "Course ID", :required => true
  end

  resource_description do
    short 'Courses of study'
    formats ['json']
    error 422, "Unprocessable Entity"
    param "Content-Type", String, "Header value, must be equal to 'application/json'"
  end

  api :GET, '/courses', 'List all Courses'
  description "Returns an array of hashes containing all the course data used in the application."
  this_example = JSON.parse '[{"id": 1,"name": "Coursera MOOC", "description":"Online Ruby Course", "created_at": "2015-10-27T16:08:29.099Z"}]'
  example "Response:\n#{JSON.pretty_generate(this_example)}"

  def index
    super
  end

  private
  
    def model
      Course
    end

end
