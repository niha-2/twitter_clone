class UserProfilesController < ApplicationController

  def show
    return unless user_signed_in?

    @current_user_tweets = Tweet.where(user_id: current_user.id).includes(:user).order(created_at: :desc)
    @current_user_like_tweets = current_user.like_tweets.includes(:user).order(created_at: :desc)
    @current_user_retweet_tweets = current_user.retweet_tweets.includes(:user).order(created_at: :desc)
    @current_user_comment_tweets = current_user.comment_tweets.includes(:user).order(created_at: :desc)
  end
end
