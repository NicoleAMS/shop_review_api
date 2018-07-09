require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do

  describe 'GET #index' do
    before(:each) do
      6.times { FactoryGirl.create(:review) }
      get :index
    end

    it 'returns 6 records from the database' do
      product_response = JSON.parse(response.body, symbolize_names: true)
      expect(product_response[:data].count).to eql(6)
      expect(product_response[:message]).to eql('Loaded reviews')
    end

    it { should respond_with 200 }
  end

end