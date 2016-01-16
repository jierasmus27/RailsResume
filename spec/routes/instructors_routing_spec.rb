require 'rails_helper'

describe Api::V1::InstructorsController, type: :routing do
  context "routing" do
    it "should route get requests to the index method" do
      expect(:get => "/rails_resume/api/instructors").to route_to("api/v1/instructors#index", :format => :json)
    end

    it "should route get requests to the show method" do
      expect(:get => "/rails_resume/api/instructors/1").to route_to("api/v1/instructors#show", :id => "1", :format => :json)
    end

    it "should route post requests to the create method" do
      expect(:post => "/rails_resume/api/instructors").to route_to("api/v1/instructors#create", :format => :json)
    end

    it "should route patch requests to the update method" do
      expect(:patch => "/rails_resume/api/instructors/1").to route_to("api/v1/instructors#update", :id => "1", :format => :json)
    end
  end
end
