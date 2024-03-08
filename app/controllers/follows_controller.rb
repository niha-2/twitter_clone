# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    return unless user_signed_in?

    current_user.follow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_back(fallback_location: root_path)
  end
end
