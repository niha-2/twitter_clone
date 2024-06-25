# frozen_string_literal: true

module Notifyable
  extend ActiveSupport::Concern

  included do
    after_create :create_and_send_notification
  end

  private

  def create_and_send_notification
    notice = Notice.new(user_id: self.user_id, tweet_id: self.tweet_id, action_type: self.class.name.downcase)
    return unless notice.save

    NotifierMailer.send_notification_email(notice).deliver_now
  end

end
