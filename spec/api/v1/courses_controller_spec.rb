require 'rails_helper'

describe Api::V1::CoursesController, type: :controller do
  context "index calls" do
    it "returns a list of all courses" do
      course_mooc = create(:course, name: "MOOC")
      course_uni  = create(:course, name: "University")

      get :index
      expect(assigns(:data)).to match_array([course_mooc, course_uni])
    end
  end

  # context "show calls" do
  #   it "shows details of the requested course" do
  #     course = create(:course_with_children)
  #
  #     get :show, id: course.id
  #     expect(assigns(:data)).to eq(course)
  #   end
  #
  #   it "returns an http_not_found if the course cannot be found" do
  #     course = create(:course)
  #
  #     get :show, id: course.id + 100
  #     expect(response).to have_http_status(:not_found)
  #   end
  # end
  #
  # context "create calls" do
  #   it "successfully creates a new course for a valid entity" do
  #     expect{post :create, course: attributes_for(:course)}.to change(Course, :count).by(1)
  #   end
  #
  #   it "returns unprocessable_entity for an invalid entity - no name provided" do
  #     post :create, course: {"name" => nil, "description" => "University of California - Berkeley"}
  #     expect(response).to have_http_status(:unprocessable_entity)
  #   end
  #
  #   it "returns unprocessable_entity for an invalid entity - no description provided" do
  #     post :create, course: {"name" => "UC Berkeley", "description" => nil}
  #     expect(response).to have_http_status(:unprocessable_entity)
  #   end
  # end
  #
  # context "update calls" do
  #   before :each do
  #     @course = create(:course, name: "UCLA", description: "University of California, Los Angeles")
  #   end
  #
  #   it "successfully updates an course for a valid entity" do
  #     expect{patch :update, id: @course, course: attributes_for(:course, name: "UKZN")}.to_not change(Course, :count)
  #   end
  #
  #   it "returns a successful response if the update is successful" do
  #     patch :update, id: @course, course: attributes_for(:course, name: "UKZN")
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it "returns a successful response if the update is successful" do
  #     patch :update, id: @course, course: attributes_for(:course, name: "UKZN")
  #
  #     get :show, id: @course.id
  #     expect(JSON.parse(response.body)["course"]["name"]).to eq("UKZN")
  #   end
  #
  #   it "returns unprocessable_entity for an invalid entity - duplicate name provided" do
  #     course = create(:course, name: "UC Berkeley")
  #     patch :update, id: @course, course: {"name" => "UC Berkeley", "description" => "University of California - Berkeley"}
  #     expect(response).to have_http_status(:unprocessable_entity)
  #   end
  #
  #   it "returns unprocessable_entity for an invalid entity - no name provided" do
  #     patch :update, id: @course, course: {"name" => nil, "description" => "University of California - Berkeley"}
  #     expect(response).to have_http_status(:unprocessable_entity)
  #   end
  #
  #   it "returns unprocessable_entity for an invalid entity - no description provided" do
  #     patch :update, id: @course, course: {"name" => "UC Berkeley", "description" => nil}
  #     expect(response).to have_http_status(:unprocessable_entity)
  #   end
  # end
end
