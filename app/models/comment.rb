# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  validates :comment, presence: true, length: { maximum: 140 }

  def comment_created_at_date
    created_at.strftime('%Y年%m月%d日')
  end

  def comment_created_at_time
    created_at.strftime('%H:%M')
  end

  def comment_created_hour_from_now
    ((Time.zone.now - created_at) / 1.hour).round
  end

  def comment_created_minute_from_now
    ((Time.zone.now - created_at) / 1.minute).round
  end

  def comment_created_period_from_now
    if comment_created_minute_from_now < 60
      "#{comment_created_minute_from_now}分前"
    elsif
      comment_created_hour_from_now < 24
      "#{comment_created_hour_from_now}時間前"
    else
      comment_created_at_date
    end
  end

end
