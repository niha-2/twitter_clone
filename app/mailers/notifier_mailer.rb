class NotifierMailer < ApplicationMailer
  default :from => ENV['SENDER_ADDRESS']

  def send_notification_email(notice)
    @notice = notice
    mail(to: @notice.tweet.user.email, subject: "Xからの通知です。")
  end
end
