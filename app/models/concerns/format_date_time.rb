# frozen_string_literal: true

module FormatDateTime
  extend ActiveSupport::Concern

  def created_hour_from_now
    ((Time.zone.now - created_at) / 1.hour).round
  end

  def created_minute_from_now
    ((Time.zone.now - created_at) / 1.minute).round
  end

  def created_period_from_now
    if created_minute_from_now < 60
      "#{created_minute_from_now}分前"
    elsif created_hour_from_now < 24
      "#{created_hour_from_now}時間前"
    else
      I18n.l(created_at, format: :date)
    end
  end
end
