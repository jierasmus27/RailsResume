require 'rails_helper'

describe Api::V1::InstitutionsController, type: :controller do
  context "index calls" do
    it "returns a list of all institutions" do
      institution_ucla = create(:institution, name: "UCLA")
      institution_edx  = create(:institution, name: "EdX")

      get :index
      expect(assigns(:data)).to match_array([institution_ucla, institution_edx])
    end
  end

  context "show calls" do
    it "shows details of the requested institution" do
      institution = create(:institution_with_children)

      get :show, id: institution.id
      expect(assigns(:data)).to eq(institution)
    end

    it "returns an http_not_found if the institution cannot be found" do
      institution = create(:institution)

      get :show, id: institution.id + 100
      expect(response).to have_http_status(:not_found)
    end
  end

  context "create calls" do
    it "successfully creates a new institution for a valid entity" do
      expect{post :create, institution: attributes_for(:institution)}.to change(Institution, :count).by(1)
    end

    it "returns unprocessable_entity for an invalid entity - no name provided" do
      post :create, institution: {"name" => nil, "description" => "University of California - Berkeley"}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns unprocessable_entity for an invalid entity - no description provided" do
      post :create, institution: {"name" => "UC Berkeley", "description" => nil}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context "update calls" do
    before :each do
      @institution = create(:institution, name: "UCLA", description: "University of California, Los Angeles")
    end

    it "successfully updates an institution for a valid entity" do
      expect{patch :update, id: @institution, institution: attributes_for(:institution, name: "UKZN")}.to_not change(Institution, :count)
    end

    it "returns a successful response if the update is successful" do
      patch :update, id: @institution, institution: attributes_for(:institution, name: "UKZN")
      expect(response).to have_http_status(:success)
    end

    it "returns a successful response if the update is successful" do
      patch :update, id: @institution, institution: attributes_for(:institution, name: "UKZN")

      get :show, id: @institution.id
      expect(JSON.parse(response.body)["institution"]["name"]).to eq("UKZN")
    end

    it "returns unprocessable_entity for an invalid entity - duplicate name provided" do
      institution = create(:institution, name: "UC Berkeley")
      patch :update, id: @institution, institution: {"name" => "UC Berkeley", "description" => "University of California - Berkeley"}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns unprocessable_entity for an invalid entity - no name provided" do
      patch :update, id: @institution, institution: {"name" => nil, "description" => "University of California - Berkeley"}
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "returns unprocessable_entity for an invalid entity - no description provided" do
      patch :update, id: @institution, institution: {"name" => "UC Berkeley", "description" => nil}
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
