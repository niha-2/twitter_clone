# frozen_string_literal: true

class UserProfilesController < ApplicationController

  before_action :set_user_profile, only: %i[update]

  # 編集フォームを表示する
  def edit
    return unless user_signed_in?

    @user_profile = UserProfile.find_or_create_by(user_id: current_user.id)
  end

  # プロフィールを更新する
  def update
    return unless user_signed_in?

    if @user_profile.update(user_profile_params)
      p @user_profile
      redirect_to user_profile_path, notice: 'プロフィールを更新しました'
    else
      p @user_profile
      render :edit, status: :unprocessable_entity
    end

  end

  def show
    return unless user_signed_in?

    @current_user_tweets = current_user.tweets.includes(:user).order(created_at: :desc)
    @current_user_like_tweets = current_user.like_tweets.includes(:user).order(created_at: :desc)
    @current_user_retweet_tweets = current_user.retweet_tweets.includes(:user).order(created_at: :desc)
    @current_user_comment_tweets = current_user.comment_tweets.includes(:user).order(created_at: :desc)
  end

  private

  def user_profile_params
    params.require(:user_profile).permit(:name, :self_introduction, :place, :website, :icon_image, :header_image)
  end

  def set_user_profile
    @user_profile = UserProfile.find(params[:id])
  end

end
