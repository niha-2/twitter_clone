# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    return unless user_signed_in?

    @tweets = Tweet.all.includes(user: :user_profile).order(created_at: :desc)
    @followings = Follow.where(follower_id: current_user.id)
    @followings_tweets = Tweet.where(user_id: @followings.pluck(:followed_id)).includes(:user).order(created_at: :desc)
    @tweet = Tweet.new
  end

  def show; end
end
