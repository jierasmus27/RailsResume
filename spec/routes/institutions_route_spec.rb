require 'rails_helper'

describe Api::V1::InstitutionsController, :type => :routing do
  context "routing" do
    it "should route get requests to the index page" do
      expect(:get => "/rails_resume/api/institutions/").to route_to("api/v1/institutions#index", :format => :json)
    end

    it "should route get requests to the show page" do
      expect(:get => "/rails_resume/api/institutions/1").to route_to("api/v1/institutions#show", :id => "1", :format => :json)
    end
  end

end
