# Base Controller which the rest of the API controllers can inherit from
class Api::V1::BaseController < ApplicationController

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
