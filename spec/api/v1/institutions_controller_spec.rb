require 'rails_helper'

describe Api::V1::InstitutionsController, type: "controller" do
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
      institution = create(:institution, name: "UCLA")

      get :show, {controller: "/api/v1/institutions", action: "show", id: institution.id}
      expect(assigns(:data)).to eq(institution)
    end

    it "returns an http_not_found if the institution cannot be found" do
      institution = create(:institution, name: "UCLA")

      get :show, {controller: "/api/v1/institutions", action: "show", id: institution.id + 100}
      expect(response).to have_http_status(:not_found)
    end
  end
end
