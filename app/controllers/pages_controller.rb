# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    if user_signed_in?
      @users = User.all
      @tweets = Tweet.all.order(created_at: :desc)
      @followings = Follow.where(follower_id: current_user.id)
      @followings_tweets = Tweet.where(user_id: @followings.pluck(:followed_id)).order(created_at: :desc)
    end
  end

  def show; end
end
