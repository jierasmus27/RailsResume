# API Controller for Instructors
class Api::V1::InstructorsController < Api::V1::BaseController
  before_action :set_object_from_id, only: [:show, :update]

  def_param_group :id do
    param :id, :number, "Instructor ID", :required => true
  end

  resource_description do
    short 'Instructors of study'
    formats ['json']
    error 422, "Unprocessable Entity"
    param "Content-Type", String, "Header value, must be equal to 'application/json'"
  end

  api :GET, '/instructors', 'List all Instructors'
  description "Returns an array of hashes containing all the instructor data used in the application."
  this_example = JSON.parse '[{"id": 1,"name": "Ben Smith", "description":"Coursera - Online Instructor", "created_at": "2015-10-27T16:08:29.099Z"}]'
  example "Response:\n#{JSON.pretty_generate(this_example)}"

  def index
    super
  end

  api :GET, '/instructors/:id', 'Return data of an Instructor based on the id'
  param_group :id
  error 404, "Record Not Found"
  description "Returns a hash with instructor details based on the id passed through"
  example "Request:\ninstructors/1"
  this_example = JSON.parse '{"id": 1,"name": "Ben Smith", "description":"Coursera - Online Instructor", "created_at": "2015-10-27T16:08:29.099Z"}'
  example "Response:\n#{JSON.pretty_generate(this_example)}"

  def show
    render json: @data
  end

  api :POST, '/instructors', 'Create a new instructor'
  description "Creates an instructor with the given params"
  req_example = JSON.parse '{"name" : "Ben Smith","description":"Online Instructor"}'
  example "Request\ninstructors/\n#{JSON.pretty_generate(req_example)}"
  this_example = JSON.parse '{"name": "Ben Smith", "description":"Online Instructor", "created_at": "2015-10-27T16:08:29.099Z"}'
  example "Response:\n#{JSON.pretty_generate(this_example)}"

  def create
    super
  end

  api :PATCH, '/instructors/:id', 'Update an instructor'
  error :code => 404, :desc => "Not Found"
  description "Updates an instructor entry based on the id and params passed"
  req_example = JSON.parse '{"name": "New Instructor Name"}'
  example "Request\ninstructors/\n#{JSON.pretty_generate(req_example)}"
  this_example = JSON.parse '{"name": "Ben Smith", "description":"Online Instructor", "created_at": "2015-10-27T16:08:29.099Z"}'
  example "Response:\n#{JSON.pretty_generate(this_example)}"

  def update
    super
  end

  private
    def model
      Instructor
    end

    def controller_params
      params.require(:instructor).permit(:instructor_id, :institution_id, :name, :description)
    end

end
