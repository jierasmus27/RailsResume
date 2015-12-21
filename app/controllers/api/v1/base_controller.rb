class Api::V1::BaseController < ApplicationController
  # Base Controller methods for index
  def index
    @data = model.all

    render json: @data
  end

  private

  def model
    raise NotImplementedError
  end

end
