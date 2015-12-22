class Api::V1::BaseController < ApplicationController

  def index
    @data = model.all

    render json: @data
  end

  private

    def model
      raise NotImplementedError
    end

    def set_object_from_id
      begin
        @data = model.find(params[:id])
      rescue ActiveRecord::RecordNotFound  => e
        record_not_found('record not found')
      end
    end

    def record_not_found(error)
      render :json => {error: error}, :status => :not_found
    end

end
