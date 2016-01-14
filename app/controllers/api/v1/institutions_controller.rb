class Api::V1::InstitutionsController < Api::V1::BaseController

  before_action :set_object_from_id, only: [:show, :update, :destroy]

  def_param_group :id do
    param :id, :number, "Institution ID", :required => true
  end

  resource_description do
    short 'Institutions of study'
    formats ['json']
    error 422, "Unprocessable Entity"
    param "Content-Type", String, "Header value, must be equal to 'application/json'"
  end

  api :GET, '/institutions', 'List all Institutions'
  description "Returns an array of hashes containing all the institution data used in the application."
  this_example = JSON.parse '[{"id": 1,"name": "Coursera", "description":"Online Institution", "created_at": "2015-10-27T16:08:29.099Z"}]'
  example "Response:\n#{JSON.pretty_generate(this_example)}"

  def index
    @data = model.all
    render json: @data, each_serializer: InstitutionViewSerializer, root: :institution
  end

  api :GET, '/institutions/:id', 'Return data of an Institution based on the id'
  param_group :id
  error 404, "Record Not Found"
  description "Returns a hash with institution details based on the id passed through"
  example "Request:\ninstitutions/1"
  this_example = JSON.parse '{"id": 1,"name": "Coursera", "description":"Online Institution", "created_at": "2015-10-27T16:08:29.099Z"}'
  example "Response:\n#{JSON.pretty_generate(this_example)}"

  def show
    render json: @data
  end

  api :POST, '/institutions', 'Create a new institution'
  description "Creates an institution with the given params"
  req_example = JSON.parse '{"name" : "Coursera","description":"Online Institution"}'
  example "Request\ninstitutions/\n#{JSON.pretty_generate(req_example)}"
  this_example = JSON.parse '{"name": "Coursera", "description":"Online Institution", "created_at": "2015-10-27T16:08:29.099Z"}'
  example "Response:\n#{JSON.pretty_generate(this_example)}"

  def create
    super
  end

  api :PATCH, '/institutions/:id', 'Update an institution'
  error :code => 404, :desc => "Not Found"
  description "Updates an institution entry based on the id and params passed"
  req_example = JSON.parse '{"name": "New Institution Name"}'
  example "Request\ninstitutions/\n#{JSON.pretty_generate(req_example)}"
  this_example = JSON.parse '{"name": "Coursera", "description":"Online Institution", "created_at": "2015-10-27T16:08:29.099Z"}'
  example "Response:\n#{JSON.pretty_generate(this_example)}"

  def update
    super
  end

  api :DELETE, '/institutions/:id', 'Delete an Institution based on the id'
  param_group :id
  error 404, "Record Not Found"
  description "Delete an institution details based on the id passed through"
  example "Request:\ninstitutions/1"

  def destroy
    super
  end

  private

    def model
      Institution
    end

    def controller_params
      params.require(:institution).permit(:institution_id,:name,:description)
    end

end
