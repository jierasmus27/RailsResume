module BaseV1ApipieModule
  extend Apipie::DSL::Concern

  def_param_group :id do
    param :id, :number, "Entity Ientifier", :required => true
  end

  api :GET, '/:resource_id', 'Get :resource data '
  description 'Returns an array of hashes containing all the entity data used in the application.'
  formats ['json']

  def index
    @data = model.all

    render json: @data
  end

  api :GET, '/:resource_id/:id', 'Return data of a :resource based on the id'
  param_group :id
  error 404, "Record Not Found"
  description "Returns a hash with :resource details based on the id passed through"
  formats ['json']
  # example "Request:\n:resource_id/1"
  # this_example = JSON.parse '{"id": 1,"name": "Coursera MOOC", "description":"Online Ruby Course", "image_url" : "Url where Image is located", "institution_id" : "1", "instructor_id" : "2", "created_at": "2015-10-27T16:08:29.099Z"}'
  # example "Response:\n#{JSON.pretty_generate(this_example)}"

  def show
    render json: @data
  end

  api :POST, '/:resource_id', 'Create a new :resource'
  description "Creates :resource with the given parameters <br />:index_example"
  formats ['json']
  # req_example = JSON.parse '{"name": "Coursera MOOC", "description":"Online Ruby Course", "image_url" : "Url where Image is located", "institution_id" : "1", "instructor_id" : "2"}'
  # example "Request\ncourses\n#{JSON.pretty_generate(req_example)}"
  # this_example = JSON.parse '{"name": "Coursera MOOC", "description":"Online Ruby Course", "image_url" : "Url where Image is located", "institution_id" : "1", "instructor_id" : "2"}'
  # example "Response:\n#{JSON.pretty_generate(this_example)}"

  def create
    @data = model.new(controller_params)

    if @data.save
      render json: @data, status: :created
    else
      render json: @data.errors, status: :unprocessable_entity
    end
  end

  api :PATCH, '/:resource_id/:id', 'Update a specific :resource'
  error :code => 404, :desc => "Not Found"
  description "Updates a specific :resource entry based on the id and parameters passed"
  formats ['json']
  # req_example = JSON.parse '{"name": "Coursera MOOC", "description":"Online Ruby Course", "image_url" : "Url where Image is located", "institution_id" : "1", "instructor_id" : "2", "created_at": "2015-10-27T16:08:29.099Z"}'
  # example "Request\ncourses/\n#{JSON.pretty_generate(req_example)}"
  # this_example = JSON.parse '{"name": "Coursera MOOC", "description":"Online Ruby Course", "created_at": "2015-10-27T16:08:29.099Z"}'
  # example "Response:\n#{JSON.pretty_generate(this_example)}"

  def update
    if @data.update(controller_params)
      render(json: @data, status: :ok)
    else
      render(json: @data.errors, status: :unprocessable_entity)
    end
  end

  api :DELETE, '/courses/:id', 'Delete a Course based on the id'
  param_group :id
  error 404, "Record Not Found"
  description "Delete a course details based on the id passed through"
  example "Request:\ncourses/1"

  def destroy
    @data.destroy

    head :no_content
  end

  private

    def model
      raise NotImplementedError
    end

end
