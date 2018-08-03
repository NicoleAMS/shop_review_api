class Api::V1::AreasController < ApplicationController
  def index
    areas = Area.all
    render json: { status: 'SUCCESS', message: 'Loaded areas', data: areas }, status: :ok
  end

  def show
    if Area.where(id: params[:id]).exists?
      area = Area.find(params[:id])
      shops = Shop.where(area_id: area[:id])
      data =
        {
          id: area.id,
          name: area.name,
          shops: [shops]
        }
      render json: { status: 'SUCCESS', message: 'Loaded area', data: data }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Area does not exist', data: nil }, status: 404
    end
  end

  def create
    area = Area.new(area_params)
    if area.save
      render json: { status: 'SUCCESS', message: 'Saved area', data: area }, status: 201
    else
      render json: { status: 'ERROR', message: 'Area not saved', data: area.errors }, status: :unprocessable_entity
    end
  end

  def total_area_value
    if Area.where(id: params[:id]).exists?
      total_value = { total_value: 0 }
      area = Area.find(params[:id])
      area.shops.map do |shop|
        shop.reviews.map do |review|
          review.scores.map do |score|
            total_value[:total_value] += score.value
          end
        end
      end
      render json: { status: 'SUCCESS', message: 'Loaded total value of shops in area', data: total_value }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Area does not exist', data: nil }, status: 404
    end
  end

  private

  def area_params
    params.permit(:name)
  end
end
