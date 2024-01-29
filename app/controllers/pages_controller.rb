# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    return unless user_signed_in?

    @users = User.all.includes(:tweets)
    @tweets = Tweet.all.order(created_at: :desc)
    @followings = Follow.where(follower_id: current_user.id)
    @followings_tweets = Tweet.where(user_id: @followings.pluck(:followed_id)).order(created_at: :desc)
  end

  def show; end
end
