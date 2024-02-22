# frozen_string_literal: true

class Tweet < ApplicationRecord
  include FormatDateTime
  has_one_attached :image
  belongs_to :user
  has_many :retweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :comment_users, through: :comments, source: :user
  has_many :retweet_users, through: :retweets, source: :user
  has_many :like_users, through: :likes, source: :user

  validates :tweet, presence: true, length: { maximum: 140 }
end
