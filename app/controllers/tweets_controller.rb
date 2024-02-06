# frozen_string_literal: true

class TweetsController < ApplicationController
  def create
    return unless user_signed_in?

    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    flash[:alert] = @tweet.errors.full_messages.join(', ') unless @tweet.save
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet, :image)
  end
end
