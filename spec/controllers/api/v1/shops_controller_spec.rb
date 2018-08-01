require 'rails_helper'

RSpec.describe Api::V1::ShopsController, type: :controller do
  describe 'GET #index' do
    before(:each) do
      6.times { FactoryGirl.create(:shop) }
      get :index
    end

    it 'returns 6 records from the database' do
      product_response = JSON.parse(response.body, symbolize_names: true)
      expect(product_response[:data].count).to eql(6)
      expect(product_response[:message]).to eql('Loaded shops')
    end

    it { should respond_with 200 }
  end

  describe 'POST #create' do
    context 'when successfully created' do
      before(:each) do
        area = FactoryGirl.create(:area)
        @shop_attributes = { name: 'Oxfam' }
        post :create, area_id: area.id, shop: @shop_attributes
      end

      it 'renders the json representation for the score record just created' do
        shop_response = JSON.parse(response.body, symbolize_names: true)
        expect(shop_response[:data][:name]).to eql(@shop_attributes[:name])
      end

      it { should respond_with 201 }
    end

    context 'when not successfully created' do
      before(:each) do
        area = FactoryGirl.create(:area)
        @invalid_shop_attributes = { name: '' }
        post :create, area_id: area.id, shop: @invalid_shop_attributes
      end

      it 'renders an error' do
        shop_response = JSON.parse(response.body, symbolize_names: true)
        expect(shop_response[:status]).to eql('ERROR')
        expect(shop_response[:data][:name]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end
end
