class Api::V1::ReviewsController < ApplicationController

  def index
    reviews = Review.all
    render json: {status: 'SUCCESS', message: 'Loaded reviews', data: reviews}, status: :ok
  end

  def create
    shop = Shop.find_by(:id => params[:shop_id])
    review = shop.reviews.create(review_params)
    if review.save
      render json: {status: 'SUCCESS', message: 'Saved review', data: review}, status: 201
    else
      render json: {status: 'ERROR', message: 'Review not saved', data: review.errors}, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:name)
  end

end
