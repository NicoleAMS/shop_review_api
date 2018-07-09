require 'rails_helper'

RSpec.describe Api::V1::AreasController, type: :controller do

  describe 'GET #index' do
    before(:each) do
      4.times { FactoryGirl.create(:area) }
      get :index
    end

    it 'returns 4 records from the database' do
      area_response = JSON.parse(response.body, symbolize_names: true)
      expect(area_response[:data].count).to eql(4)
      expect(area_response[:message]).to eql('Loaded areas')
    end

    it { should respond_with 200 }
  end

  describe 'GET #show' do
    before(:each) do
      @area = FactoryGirl.create(:area)
      get :show, id: @area.id
    end

    it 'returns the information' do
      area_response = JSON.parse(response.body, symbolize_names: true)
      binding.pry
      expect(area_response[:data][:name]).to eql @area.name
    end

    it { should respond_with 200 }
  end

end
