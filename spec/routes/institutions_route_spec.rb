require 'rails_helper'

describe Api::V1::InstitutionsController, :type => :routing do
  context "routing" do
    it "should route the index page" do
      expect(:get => "/rails_resume/api/institutions/").to route_to("api/v1/institutions#index", :format => :json)
    end
  end

end
