# frozen_string_literal: true

class Tweet < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :retweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :comment_users, through: :comments, source: :user
  has_many :retweet_users, through: :retweets, source: :user
  has_many :like_users, through: :likes, source: :user

  validates :tweet, presence: true, length: { maximum: 140 }


  def tweet_created_at_time
    created_at.strftime('%H:%M')
  end

  def tweet_created_at_date
    created_at.strftime('%Y年%m月%d日')
  end

  def tweet_created_hour_from_now
    ((Time.zone.now - created_at) / 1.hour).round
  end

  def tweet_created_minute_from_now
    ((Time.zone.now - created_at) / 1.minute).round
  end

  def tweet_created_period_from_now
    if tweet_created_minute_from_now < 60
      "#{tweet_created_minute_from_now}分前"
    elsif
      tweet_created_hour_from_now < 24
      "#{tweet_created_hour_from_now}時間前"
    else
      tweet_created_at_date
    end

  end
end
