# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    return unless user_signed_in?

    tweet = Tweet.find(params[:tweet_id])
    like = current_user.likes.new(tweet_id: tweet.id)
    like.save
    redirect_to pages_path
  end

  def destroy
    return unless user_signed_in?

    tweet = Tweet.find(params[:tweet_id])
    like = current_user.likes.find_by(tweet_id: tweet.id)
    like.destroy
    redirect_to pages_path
  end
end
