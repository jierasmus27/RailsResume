require 'rails_helper'

describe Api::V1::BaseController, type: :controller do
  context "base methods" do
    it "raises an error that base_model is not defined" do
      bc = Api::V1::BaseController.new
      expect{bc.index}.to raise_error(NotImplementedError)
    end
  end

  context "calls to index" do
    describe "successfull calls" do
      it "returns a list of all items and renders thema as json" do
        bc = Api::V1::BaseController.new

        model = double()
        model_all_results = {:item => "example"}

        expect(bc).to receive(:model).and_return(model)
        expect(model).to receive(:all).and_return(model_all_results)
        expect(bc).to receive(:render).with(:json => model_all_results)

        bc.index
      end
    end
  end
end
