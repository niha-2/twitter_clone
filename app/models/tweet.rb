# frozen_string_literal: true

class Tweet < ApplicationRecord
  include FormatDateTime
  has_one_attached :image
  belongs_to :user
  has_many :retweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :notices, dependent: :destroy

  has_many :comment_users, through: :comments, source: :user
  has_many :retweet_users, through: :retweets, source: :user
  has_many :like_users, through: :likes, source: :user

  validates :tweet, presence: true, length: { maximum: 140 }

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def retweeted_by?(user)
    retweets.exists?(user_id: user.id)
  end

  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
end
