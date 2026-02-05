class TweetsController < ApplicationController
  def index
    tweets = Tweet.by_user(params[:user_id])
    render json: tweets
  end

  private

  def search_params
    params.permit(:user_id)
  end
end
