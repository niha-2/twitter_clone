module Notifyable
  extend ActiveSupport::Concern

  include do
    after_create :create_and_send_notification
  end

  private

  def create_and_send_notification
    notice = Notice.new(user_id: current_user.id, tweet_id: tweet_id, action_type: action_type)
    if notice.save
      NotifierMailer.send_notification_email(notice).deliver_now
    end
  end

  def tweet_id
    case self.class.name
    when 'Comment'
      self.tweet.id
    when 'Retweet'
      self.tweet_id
    when 'Like'
      self.tweet_id
    end
  end

  def action_type
    case self.class.name
    when 'Comment'
      'comment'
    when 'Retweet'
      'retweet'
    when 'Like'
      'like'
    end
  end
end
