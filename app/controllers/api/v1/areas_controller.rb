class Api::V1::AreasController < ApplicationController

  def index
    areas = Area.all
    render json: {status: 'SUCCESS', message: 'Loaded areas', data: areas}, status: :ok
  end

  def show
    area = Area.find(params[:id])
    shops = Shop.find_by(:area_id => area[:id])
    data = {
      id: area.id,
      name: area.name,
      shops: [shops]
      }
    render json: {status: 'SUCCESS', message: 'Loaded area', data: data}, status: :ok
  end

end
