require 'rails_helper'

describe Api::V1::SessionsController, type: :routing do
  it "routes session create requests to sessions#create" do
    expect(:post => "/rails_resume/api/sessions").to route_to("api/v1/sessions#create", :format => :json)
  end

  it "routes session delete requests to sessions#destroy" do
    expect(:delete => "/rails_resume/api/sessions").to route_to("api/v1/sessions#destroy", :format => :json)
  end
end
