class Api::V1::InstitutionsController < Api::V1::BaseController

  before_action :set_object_from_id, only: [:show]

  def show
    render json: @data
  end

  private

  def model
    Institution
  end

end
