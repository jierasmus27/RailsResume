require 'rails_helper'

describe Api::V1::CoursesController, type: :routing do
  it "should route get calls to the index method" do
    expect(:get => "rails_resume/api/courses").to route_to("api/v1/courses#index", :format => :json)
  end

  it "should route get calls to the show method" do
    expect(:get => "rails_resume/api/courses/1").to route_to("api/v1/courses#show", :id => "1", :format => :json)
  end

  it "should route post calls to the create method" do
    expect(:post => "rails_resume/api/courses").to route_to("api/v1/courses#create", :format => :json)
  end

  it "should route patch calls to the update method" do
    expect(:patch => "rails_resume/api/courses/1").to route_to("api/v1/courses#update", :id => "1", :format => :json)
  end

end
