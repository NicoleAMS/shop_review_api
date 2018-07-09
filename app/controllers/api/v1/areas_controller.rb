class Api::V1::AreasController < ApplicationController

  def index
    areas = Area.all
    render json: {status: 'SUCCESS', message: 'Loaded areas', data: areas}, status: :ok
  end

end
