class Api::V1::CoursesController < Api::V1::BaseController

  before_action :set_object_from_id, only: [:show, :update, :destroy]

  include Api::V1::CoursesDocumentation

  def index
    @data = model.all

    render json: @data
  end

  def show
    render json: @data
  end

  def create
    @data = model.new(controller_params)

    if @data.save
      render json: @data, status: :created
    else
      render json: @data.errors, status: :unprocessable_entity
    end
  end

  def update
    if @data.update(controller_params)
      render(json: @data, status: :ok)
    else
      render(json: @data.errors, status: :unprocessable_entity)
    end
  end

  def destroy
    @data.destroy

    head :no_content
  end

  # def_param_group :id do
  #   param :id, :number, "Course ID", :required => true
  # end
  #
  # resource_description do
  #   resource_id 'course'
  #   short 'Courses of study'
  #   formats ['json']
  #   error 422, "Unprocessable Entity"
  #   param "Content-Type", String, "Header value, must be equal to 'application/json'"
  # end
  #
  # api :GET, '/v1/courses', 'List all Courses'
  # description "Returns an array of hashes containing all the course data used in the application."
  # this_example = JSON.parse '[{"id": 1,"name": "Coursera MOOC"}]'
  # example "Response:\n#{JSON.pretty_generate(this_example)}"
  #
  # api :GET, '/v1/courses/:id', 'Return data of an Course based on the id'
  # param_group :id
  # error 404, "Record Not Found"
  # description "Returns a hash with course details based on the id passed through"
  # example "Request:\ncourses/1"
  # this_example = JSON.parse '{"id": 1,"name": "Coursera MOOC", "description":"Online Ruby Course", "image_url" : "Url where Image is located", "institution_id" : "1", "instructor_id" : "2", "created_at": "2015-10-27T16:08:29.099Z"}'
  # example "Response:\n#{JSON.pretty_generate(this_example)}"

  # api :POST, '/v1/courses', 'Create a new course'
  # description "Creates an course with the given params"
  # req_example = JSON.parse '{"name": "Coursera MOOC", "description":"Online Ruby Course", "image_url" : "Url where Image is located", "institution_id" : "1", "instructor_id" : "2"}'
  # example "Request\ncourses\n#{JSON.pretty_generate(req_example)}"
  # this_example = JSON.parse '{"name": "Coursera MOOC", "description":"Online Ruby Course", "image_url" : "Url where Image is located", "institution_id" : "1", "instructor_id" : "2"}'
  # example "Response:\n#{JSON.pretty_generate(this_example)}"
  #
  # api :PATCH, '/v1/courses/:id', 'Update a course'
  # param_group :id
  # error :code => 404, :desc => "Not Found"
  # description "Updates an course entry based on the id and params passed"
  # req_example = JSON.parse '{"name": "Coursera MOOC", "description":"Online Ruby Course", "image_url" : "Url where Image is located", "institution_id" : "1", "instructor_id" : "2", "created_at": "2015-10-27T16:08:29.099Z"}'
  # example "Request\ncourses/\n#{JSON.pretty_generate(req_example)}"
  # this_example = JSON.parse '{"name": "Coursera MOOC", "description":"Online Ruby Course", "created_at": "2015-10-27T16:08:29.099Z"}'
  # example "Response:\n#{JSON.pretty_generate(this_example)}"
  #
  # api :DELETE, '/v1/courses/:id', 'Delete a Course based on the id'
  # param_group :id
  # error 404, "Record Not Found"
  # description "Delete a course details based on the id passed through"
  # example "Request:\ncourses/1"

  private

    def model
      Course
    end

    def controller_params
      params.require(:course).permit(:course_id,:name,:description,:image_url,:course_id,:instructor_id)
    end

end
