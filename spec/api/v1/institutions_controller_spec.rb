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
end
