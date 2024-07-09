# frozen_string_literal: true

class NotifierMailer < ApplicationMailer
  def send_notification_email(notice)
    @notice = notice
    mail(to: @notice.tweet.user.email, subject: 'Xからの通知です。')
  end
end
