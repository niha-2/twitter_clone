# frozen_string_literal: true

class RetweetsController < ApplicationController
  def create
    return unless user_signed_in?

    tweet = Tweet.find(params[:tweet_id])
    retweet = current_user.retweets.new(tweet_id: tweet.id)
    retweet.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    return unless user_signed_in?

    tweet = Tweet.find(params[:tweet_id])
    retweet = current_user.retweets.find_by(tweet_id: tweet.id)
    retweet.destroy
    redirect_back(fallback_location: root_path)
  end
end
