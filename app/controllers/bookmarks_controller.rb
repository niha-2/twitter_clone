# frozen_string_literal: true

class BookmarksController < ApplicationController
  def create
    return unless user_signed_in?

    tweet = Tweet.find(params[:tweet_id])
    bookmark = current_user.bookmarks.new(tweet_id: tweet.id)
    bookmark.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    return unless user_signed_in?

    tweet = Tweet.find(params[:tweet_id])
    bookmark = current_user.bookmarks.find_by(tweet_id: tweet.id)
    bookmark.destroy
    redirect_back(fallback_location: root_path)
  end

  def index
    return unless user_signed_in?

    @current_user_bookmark_tweets = current_user.bookmark_tweets.includes(:user).order(created_at: :desc)
  end
end
