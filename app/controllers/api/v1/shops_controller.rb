class Api::V1::ShopsController < ApplicationController

  def index
    shops = Shop.all
    render json: {status: 'SUCCESS', message: 'Loaded shops', data: shops}, status: :ok
  end

end
