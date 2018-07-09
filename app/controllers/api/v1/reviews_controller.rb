class Api::V1::ReviewsController < ApplicationController

  def index
    reviews = Review.all
    render json: {status: 'SUCCESS', message: 'Loaded reviews', data: reviews}, status: :ok
  end
end
