class Api::V1::ReviewsController < ApplicationController
  def index
    reviews = Review.all
    render json: { status: 'SUCCESS', message: 'Loaded reviews', data: reviews }, status: :ok
  end

  def create
    shop = Shop.find_by(id: params[:shop_id])
    review = shop.reviews.create(review_params)
    if review.save
      render json: { status: 'SUCCESS', message: 'Saved review', data: review }, status: 201
    else
      render json: { status: 'ERROR', message: 'Review not saved', data: review.errors }, status: :unprocessable_entity
    end
  end

  def show
    review = Review.find(params[:id])
    scores = Score.where(review_id: review[:id])
    data = {
      id: review.id,
      name: review.name,
      scores: [scores]
    }
    render json: { status: 'SUCCESS', message: 'Loaded review', data: data }, status: :ok
  end

  private

  def review_params
    params.permit(:id, :name, :shop_id, scores_attributes: [:id, :name, :value])
  end
end
