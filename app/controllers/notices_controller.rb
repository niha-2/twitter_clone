# frozen_string_literal: true

class NoticesController < ApplicationController
  def index
    current_user_tweets = current_user.tweets
    @notices = Notice.where(tweet: current_user_tweets)
                     .includes(user: [:user_profile])
                     .includes(:user)
                     .order(created_at: :desc).limit(10)
  end
end
