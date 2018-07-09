require 'rails_helper'

RSpec.describe Api::V1::AreasController, type: :controller do

  describe 'GET #index' do
    before(:each) do
      4.times { FactoryGirl.create(:area) }
      get :index
    end

    it 'returns 4 records from the database' do
      product_response = JSON.parse(response.body, symbolize_names: true)
      expect(product_response[:data].count).to eql(4)
      expect(product_response[:message]).to eql('Loaded areas')
    end

    it { should respond_with 200 }
  end

end
