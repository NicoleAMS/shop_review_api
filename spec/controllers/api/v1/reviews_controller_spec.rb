require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  describe 'GET #index' do
    before(:each) do
      6.times { FactoryGirl.create(:review) }
      get :index
    end

    it 'returns 6 records from the database' do
      product_response = json_response
      expect(product_response[:data].count).to eql(6)
      expect(product_response[:message]).to eql('Loaded reviews')
    end

    it { should respond_with 200 }
  end

  describe 'GET #show' do
    context 'when successfully loaded' do
      before(:each) do
        @review = FactoryGirl.create(:review)
        get :show, id: @review.id
      end

      it 'returns the information' do
        review_response = json_response
        expect(review_response[:data][:name]).to eql(@review.name)
      end

      it { should respond_with 200 }
    end

    context 'when not successfully loaded' do
      before(:each) do
        @review = FactoryGirl.create(:review)
        get :show, id: (@review.id + 1000)
      end

      it 'raises a 404 error' do
        response.response_code.should == 404
      end
    end
  end

  describe 'POST #create' do
    context 'when successfully created' do
      before(:each) do
        shop = FactoryGirl.create(:shop)
        @review_attributes = FactoryGirl.attributes_for(:review)
        post :create, { shop_id: shop.id, name: @review_attributes[:name] }, format: :json
      end

      it 'renders the json representation for the score record just created' do
        review_response = json_response
        expect(review_response[:data][:name]).to eql(@review_attributes[:name])
      end

      it { should respond_with 201 }
    end

    context 'when not successfully created' do
      before(:each) do
        shop = FactoryGirl.create(:shop)
        @invalid_review_attributes = { name: '' }
        post :create, shop_id: shop.id, name: @invalid_review_attributes[:name]
      end

      it 'renders an error' do
        review_response = json_response
        expect(review_response[:status]).to eql('ERROR')
        expect(review_response[:data][:name]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end
end
