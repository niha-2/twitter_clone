class TweetsController < ApplicationController

  def create
    return unless user_signed_in?

    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      redirect_to root_path
    else
      flash[:alert] = @tweet.errors.full_messages.join(', ')
      redirect_to root_path
    end
  end

    private

    def tweet_params
      params.require(:tweet).permit(:tweet, :image)
    end

end
