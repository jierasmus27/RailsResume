module Api::V1::InstructorsDocumentation
  extend BaseApipieModule
#
  namespace 'api/v1'#, name: 'private_v1'
  resource :instructors

  def_param_group :id do
    param :id, :number, "Instructor ID", :required => true
  end

  resource_description do
    resource_id 'instructor'
    short 'Instructors of study'
    formats ['json']
    error 422, "Unprocessable Entity"
    param "Content-Type", String, "Header value, must be equal to 'application/json'"
  end

  # TODO: Add auth
  # defaults do
  #   auth_with :password
  # end

  doc_for :index do
    api :GET, '/v1/instructors', 'List all Instructors'
    description "Returns an array of hashes containing all the instructor data used in the application."
    this_example = JSON.parse '[{"id": 1,"name": "Coursera MOOC"}]'
    example "Response:\n#{JSON.pretty_generate(this_example)}"
  end

  doc_for :show do
    api :GET, '/v1/instructors/:id', 'Return data of an instructor based on the id'
    param_group :id
    error 404, "Record Not Found"
    description "Returns a hash with instructor details based on the id passed through"
    example "Request:\ninstructors/1"
    this_example = JSON.parse '{"id": 1,"name": "Coursera MOOC", "description":"Online Ruby instructor", "image_url" : "Url where Image is located", "instructor_id" : "1", "instructor_id" : "2", "created_at": "2015-10-27T16:08:29.099Z"}'
    example "Response:\n#{JSON.pretty_generate(this_example)}"
  end

  doc_for :create do
    api :POST, '/v1/instructors', 'Create a new instructor'
    description "Creates an instructor with the given params"
    req_example = JSON.parse '{"name": "Coursera MOOC", "description":"Online Ruby instructor", "image_url" : "Url where Image is located", "instructor_id" : "1", "instructor_id" : "2"}'
    example "Request\ninstructors\n#{JSON.pretty_generate(req_example)}"
    this_example = JSON.parse '{"name": "Coursera MOOC", "description":"Online Ruby instructor", "image_url" : "Url where Image is located", "instructor_id" : "1", "instructor_id" : "2"}'
    example "Response:\n#{JSON.pretty_generate(this_example)}"
  end

  doc_for :update do
    api :PATCH, '/v1/instructors/:id', 'Update a instructor'
    param_group :id
    error :code => 404, :desc => "Not Found"
    description "Updates an instructor entry based on the id and params passed"
    req_example = JSON.parse '{"name": "Coursera MOOC", "description":"Online Ruby instructor", "image_url" : "Url where Image is located", "instructor_id" : "1", "instructor_id" : "2", "created_at": "2015-10-27T16:08:29.099Z"}'
    example "Request\ninstructors/\n#{JSON.pretty_generate(req_example)}"
    this_example = JSON.parse '{"name": "Coursera MOOC", "description":"Online Ruby instructor", "created_at": "2015-10-27T16:08:29.099Z"}'
    example "Response:\n#{JSON.pretty_generate(this_example)}"
  end

  doc_for :delete do
    api :DELETE, '/v1/instructors/:id', 'Delete a instructor based on the id'
    param_group :id
    error 404, "Record Not Found"
    description "Delete a instructor details based on the id passed through"
    example "Request:\ninstructors/1"
  end

end
