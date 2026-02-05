class TweetsController < ApplicationController
  def index
    page = params[:page].present? ? params[:page].to_i : 1
    per_page = params[:per_page].present? ? params[:per_page].to_i : 5
    offset = (page - 1) * per_page

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
