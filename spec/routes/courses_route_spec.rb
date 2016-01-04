require 'rails_helper'

describe Api::V1::CoursesController, type: :routing do
  it "should route get calls to index method" do
    expect(:get => "rails_resume/api/courses").to route_to("api/v1/courses#index", :format => :json)
  end
end
