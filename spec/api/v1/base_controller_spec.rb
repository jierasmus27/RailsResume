require 'rails_helper'

describe Api::V1::BaseController, type: :controller do
  context "base methods" do
    it "raises an error that base_model is not defined" do
      expect{controller.index}.to raise_error(NotImplementedError)
    end
  end

  context "calls to index" do
    describe "successfull calls" do
      it "returns a list of all items and renders thema as json" do
        model = double()
        model_all_results = {:item => "example"}

        expect(controller).to receive(:model).and_return(model)
        expect(model).to receive(:all).and_return(model_all_results)
        expect(controller).to receive(:render).with(:json => model_all_results)

        controller.index
      end
    end
  end

  context "calls to create" do
    describe "unsuccessful calls" do
      it "raises an error that base_model is not defined" do
        expect{controller.create}.to raise_error(NotImplementedError)
      end

      it "raises an error that controller_params is not defined" do
        model = double()
        expect(controller).to receive(:model).and_return(model)
        expect{controller.create}.to raise_error(NotImplementedError)
      end
    end
  end

  context "calls to destroy" do
    describe "unsuccessful calls" do
      it "raises an error that base_model is not defined" do
        expect{controller.create}.to raise_error(NotImplementedError)
      end

      it "raises an error that controller_params is not defined" do
        model = double()
        expect(controller).to receive(:model).and_return(model)
        expect{controller.create}.to raise_error(NotImplementedError)
      end
    end
  end


end
