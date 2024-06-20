# frozen_string_literal: true

module Notifyable
  extend ActiveSupport::Concern

  included do
    after_create :create_and_send_notification
  end

  private

  def create_and_send_notification
    notice = Notice.new(user_id: self.user_id, tweet_id:, action_type:)
    return unless notice.save

    NotifierMailer.send_notification_email(notice).deliver_now
  end

  def tweet_id
    case self.class.name
    when 'Comment'
      tweet.id
    when 'Retweet'
      self[:tweet_id]
    when 'Like'
      self[:tweet_id]
    end
  end

  def action_type
    action_types = {
      'Comment' => 'comment',
      'Retweet' => 'retweet',
      'Like' => 'like'
    }
    action_types[self.class.name]
  end
end
