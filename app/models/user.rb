# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[github]

  has_many_attached :images
  has_many :tweets, dependent: :destroy
  has_many :active_follow, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_follow, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy
  has_many :follower, through: :passive_follow, source: :follower
  has_many :followings, through: :active_follow, source: :followed

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
end
