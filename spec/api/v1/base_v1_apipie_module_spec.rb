require 'rails_helper'

describe BaseV1ApipieModule, :type => :controller do
  controller(ApplicationController) do
    include BaseV1ApipieModule
  end

  context '#index' do
    describe 'unsuccessful calls' do
      it 'will raise an error for not setting the model' do
        expect{get :index}.to raise_error(NotImplementedError)
      end
    end
  end

  context '#show' do
    describe 'unsuccessful calls' do
      it 'will raise an error for not setting the model' do
        expect{get :show, id: 1}.to raise_error(NotImplementedError)
      end
    end
  end

  context '#create' do
    describe 'unsuccessful calls' do
      it 'will raise an error for not setting the model' do
        expect{post :create}.to raise_error(NotImplementedError)
      end
    end
  end

end
