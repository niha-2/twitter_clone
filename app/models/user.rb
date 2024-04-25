# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[github]

  # フォローした、されたの関係
  has_many :active_follow, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :passive_follow, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy, inverse_of: :followed

  # メッセージを送った、受け取ったの関係
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id', dependent: :destroy, inverse_of: :sender
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id', dependent: :destroy,
                               inverse_of: :receiver

  has_many :tweets, dependent: :destroy
  has_one :user_profile, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :retweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  has_many :followers, through: :passive_follow, source: :follower # 自分をフォローしている人
  has_many :followings, through: :active_follow, source: :followed # 自分がフォローしている人

  has_many :like_tweets, through: :likes, source: :tweet
  has_many :retweet_tweets, through: :retweets, source: :tweet
  has_many :comment_tweets, through: :comments, source: :tweet
  has_many :bookmark_tweets, through: :bookmarks, source: :tweet

  validates :user_name, presence: true
  validates :phone_number, presence: true
  validates :date_of_birth, presence: true
  validates :uid, presence: true, uniqueness: { scope: :provider }

  def self.from_omniauth(auth)
    find_or_create_by!(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.user_name = auth.info.name
      user.password = Devise.friendly_token[0, 20]
      user.phone_number = '00000000000'
      user.date_of_birth = Time.zone.today

      user.skip_confirmation!
    end
  end

  def self.create_unique_string
    SecureRandom.uuid
  end

  def user_jp_date_of_birth
    date_of_birth.strftime('%Y年%m月%d日')
  end

  def user_create_at_month
    created_at.strftime('%Y年%m月')
  end

  # フォローする
  def follow(user_id)
    active_follow.create(followed_id: user_id)
  end

  # フォロー解除する
  def unfollow(user_id)
    active_follow.find_by(followed_id: user_id).destroy
  end

  # フォローしているか
  def followings?(user)
    followings.include?(user)
  end

  # 特定のユーザーに送受信したメッセージを取得
  def messages_with(user)
    Message.where(sender_id:  id, receiver_id: user.id).or(Message.where(sender_id: user.id, receiver_id: id))
  end

  # ログインユーザーのメッセージをすべて取得
  def all_messages
    Message.where(receiver_id: id).or(Message.where(sender_id: id))
  end

  # ログインユーザーの各ユーザーごとの最新のメッセージIDを取得
  def latest_messages_ids
    all_messages.group('LEAST(sender_id, receiver_id)', 'GREATEST(sender_id, receiver_id)').pluck('MAX(id)')
  end

  def message_with?(user)
    messages_with(user).present?
  end
end
