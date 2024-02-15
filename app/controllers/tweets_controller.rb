# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    tweet = current_user.tweets.build(tweet_params)
    flash[:alert] = @tweet.errors.full_messages.join(', ') unless tweet.save
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet, :image)
  end
end
