# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    return unless user_signed_in?

    @comment = Comment.new(comment_params)
    @comment.user = current_user
    flash[:alert] = @comment.errors.full_messages.join(', ') unless @comment.save

    redirect_to tweet_path(@comment.tweet)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(tweet_id: params[:tweet_id], user_id: current_user.id)
  end
end
