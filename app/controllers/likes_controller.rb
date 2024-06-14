# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    return unless user_signed_in?

    tweet = Tweet.find(params[:tweet_id])
    like = current_user.likes.new(tweet_id: tweet.id)
    like.save

    notice = Notice.new(user_id: current_user.id, tweet_id: tweet.id, action_type: 'like')
    notice.save
    NotifierMailer.send_notification_email(notice).deliver_now

    redirect_back(fallback_location: root_path)
  end

  def destroy
    return unless user_signed_in?

    tweet = Tweet.find(params[:tweet_id])
    like = current_user.likes.find_by(tweet_id: tweet.id)
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end
