class Api::V1::ScoresController < ApplicationController
  def index
    scores = Score.all
    render json: { status: 'SUCCESS', message: 'Loaded scores', data: scores }, status: :ok
  end

  def show
    if Score.where(id: params[:id]).exists?
      score = Score.find(params[:id])
      render json: { status: 'SUCCESS', message: 'Loaded score', data: score }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Score does not exist', data: nil }, status: 404
    end
  end

  def create
    review = Review.find_by(id: params[:review_id])
    score = review.scores.create(score_params)
    if score.save
      render json: { status: 'SUCCESS', message: 'Loaded score', data: score }, status: 201
    else
      render json: { status: 'ERROR', message: 'Score not saved', data: score.errors }, status: :unprocessable_entity
    end
  end

  private

  def score_params
    params.require(:score).permit(:name, :value)
  end
end
