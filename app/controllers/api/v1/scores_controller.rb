class Api::V1::ScoresController < ApplicationController

  def index
    scores = Score.all
    render json: {status: 'SUCCESS', message: 'Loaded scores', data: scores}, status: :ok
  end

end
