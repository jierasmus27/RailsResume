# Base Controller which the rest of the API controllers can inherit from
class Api::V1::BaseController < ApplicationController

  private

    def model
      raise NotImplementedError
    end

    def controller_params
      raise NotImplementedError
    end

    def set_object_from_id
      begin
        @data = model.find(params[:id])
      rescue ActiveRecord::RecordNotFound  => record_error
        record_not_found('record not found')
      end
    end

    def record_not_found(error)
      render :json => {error: error}, :status => :not_found
    end

end
