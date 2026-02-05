class TweetsController < ApplicationController
  def index
    page = params[:page].present? ? params[:page] : 0
    per_page = params[:per_page].present? ? params[:per_page] : 5
    tweets = Tweet
              .by_user(params[:user_id])
              .offset(page)
              .limit(per_page)
              .order(:id)

    render json: tweets
  end

  private

  def search_params
    params.permit(:user_id)
    params.permit(:page)
    params.permit(:per_page)
  end
end
