class Api::V1::ShopsController < ApplicationController
  def index
    shops = Shop.all
    render json: { status: 'SUCCESS', message: 'Loaded shops', data: shops }, status: :ok
  end

  def show
    if Shop.where(id: params[:id]).exists?
      shop = Shop.find(params[:id])
      reviews = Review.where(shop_id: shop[:id])
      data = {
        id: shop.id,
        name: shop.name,
        reviews: [reviews]
      }
      render json: { status: 'SUCCESS', message: 'Loaded area', data: data }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Shop does not exist', data: nil }, status: 404
    end
  end

  def create
    area = Area.find_by(id: params[:area_id])
    shop = area.shops.create(shop_params)
    if shop.save
      render json: { status: 'SUCCESS', message: 'Saved shop', data: shop }, status: 201
    else
      render json: { status: 'ERROR', message: 'Shop not saved', data: shop.errors }, status: :unprocessable_entity
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name)
  end
end
