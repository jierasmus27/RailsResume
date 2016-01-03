require 'rails_helper'

describe Api::V1::InstructorsController, type: :controller do
  context "index calls" do
    it "returns a list of all instructors" do
      institution = create(:institution)
      instructor_ucla = create(:instructor, name: "Ben Smith", institution_id: institution.id)
      instructor_edx  = create(:instructor, name: "John Doe", institution_id: institution.id)

      get :index
      expect(assigns(:data)).to match_array([instructor_ucla, instructor_edx])
    end
  end

  context "show calls" do
    before :each do
      institution = create(:institution)
      @instructor = create(:instructor, name: "Ben Smith", institution_id: institution.id)
    end

    it "shows details of the requested instructor" do
      get :show, id: @instructor.id
      expect(assigns(:data)).to eq(@instructor)
    end

    it "returns an http_not_found if the instructor cannot be found" do
      get :show, id: @instructor.id + 100
      expect(response).to have_http_status(:not_found)
    end
  end

  context "create calls" do
    before :each do
      @instructor = create(:instructor)
      @instructor_attributes = @instructor.attributes.except("id", "created_at", "updated_at")
    end

    it "successfully creates a new instructor for a valid entity" do
      expect{post :create, instructor: @instructor_attributes}.to change(Instructor, :count).by(1)
    end

    it "successfully creates a new instructor for a valid entity" do
      post :create, instructor: @instructor_attributes
      expect(response).to have_http_status(:success)
    end

    it "returns unprocessable_entity for an invalid entity - no institution provided" do
      post :create, instructor: {"name" => "Ben Smith", "description" => "University of California - Berkeley"}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns unprocessable_entity for an invalid entity - no name provided" do
      post :create, instructor: {"name" => nil, "description" => "University of California - Berkeley", "institution_id" => @instructor.institution.id}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns unprocessable_entity for an invalid entity - no description provided" do
      post :create, instructor: {"name" => "Brian Johnson", "description" => nil, "institution_id" => @instructor.institution.id}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context "update calls" do
    before :each do
      @instructor = create(:instructor, name: "Ben Smith", description: "University of California, Los Angeles")
      @instructor_attributes = @instructor.attributes.except("id", "created_at", "updated_at")
    end

    it "successfully updates an instructor for a valid entity" do
      @instructor_attributes["name"] = "Craig Brown"
      expect{patch :update, id: @instructor, instructor: @instructor_attributes}.to_not change(Instructor, :count)
    end

    it "returns a successful response if the update is successful" do
      patch :update, id: @instructor, instructor: attributes_for(:instructor, name: "Craig Brown")
      expect(response).to have_http_status(:success)
    end

    it "returns a successful response if the update is successful" do
      patch :update, id: @instructor, instructor: attributes_for(:instructor, name: "Craig Brown")

      get :show, id: @instructor.id

      expect(JSON.parse(response.body)["instructor"]["name"]).to eq("Craig Brown")
    end

    it "returns unprocessable_entity for an invalid entity - duplicate name provided" do
      instructor = create(:instructor, name: "Brian Johnson")
      patch :update, id: @instructor, instructor: {"name" => "Brian Johnson", "description" => "University of California - Berkeley"}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns unprocessable_entity for an invalid entity - no name provided" do
      patch :update, id: @instructor, instructor: {"name" => nil, "description" => "University of California - Berkeley"}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns unprocessable_entity for an invalid entity - no description provided" do
      patch :update, id: @instructor, instructor: {"name" => "Brian Johnson", "description" => nil}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
