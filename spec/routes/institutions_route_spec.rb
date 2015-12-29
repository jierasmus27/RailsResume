require 'rails_helper'

describe Api::V1::InstitutionsController, :type => :routing do
  context "routing" do
    it "should route get requests to the index method" do
      expect(:get => "/rails_resume/api/institutions/").to route_to("api/v1/institutions#index", :format => :json)
    end

    it "should route get requests to the show method" do
      expect(:get => "/rails_resume/api/institutions/1").to route_to("api/v1/institutions#show", :id => "1", :format => :json)
    end

    it "should route post requests to the create method" do
      expect(:post => "/rails_resume/api/institutions").to route_to("api/v1/institutions#create", :format => :json)
    end
  end

end
