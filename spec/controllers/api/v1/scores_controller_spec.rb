require 'rails_helper'

RSpec.describe Api::V1::ScoresController, type: :controller do
  describe 'GET #index' do
    before(:each) do
      6.times { FactoryGirl.create(:score) }
      get :index
    end

    it 'returns 6 records from the database' do
      product_response = JSON.parse(response.body, symbolize_names: true)
      expect(product_response[:data].count).to eql(6)
      expect(product_response[:message]).to eql('Loaded scores')
    end

    it { should respond_with 200 }
  end

  describe 'GET #show' do
    context 'when successfully loaded' do
      before(:each) do
        @score = FactoryGirl.create(:score)
        get :show, id: @score.id
      end

      it 'returns the information' do
        score_response = JSON.parse(response.body, symbolize_names: true)
        expect(score_response[:data][:name]).to eql(@score.name)
      end

      it { should respond_with 200 }
    end

    context 'when not successfully loaded' do
      before(:each) do
        @score = FactoryGirl.create(:score)
        get :show, id: (@score.id + 1000)
      end

      it 'raises a 404 error' do
        response.response_code.should == 404
      end
    end
  end

  describe 'POST #create' do
    context 'when successfully created' do
      before(:each) do
        review = FactoryGirl.create(:review)
        @score_attributes = { name: 'Friendliness', value: 4 }
        post :create, review_id: review.id, score: @score_attributes
      end

      it 'renders the json representation for the score record just created' do
        score_response = JSON.parse(response.body, symbolize_names: true)
        expect(score_response[:data][:name]).to eql(@score_attributes[:name])
      end

      it { should respond_with 201 }
    end

    context 'when not successfully created' do
      before(:each) do
        review = FactoryGirl.create(:review)
        @invalid_score_attributes = { name: 'Friendliness', value: 14 }
        post :create, review_id: review.id, score: @invalid_score_attributes
      end

      it 'renders an error' do
        score_response = JSON.parse(response.body, symbolize_names: true)
        expect(score_response[:status]).to eql('ERROR')
        expect(score_response[:data][:value]).to include 'must be less than or equal to 5'
      end

      it { should respond_with 422 }
    end
  end
end
