# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_latest_messages, only: %i[index]

  # 送信者ごとに最新のメッセージを取得
  def index
    return if @latest_messages.blank?

    @receiver = if @latest_messages.first.receiver_id == current_user.id
                  @latest_messages.first.sender
                else
                  @latest_messages.first.receiver
                end
    current_user_messages_with(@receiver)
  end

  private

  def set_latest_messages
    latest_messages_ids = current_user.latest_messages_ids
    @latest_messages = Message.where(id: latest_messages_ids).includes(sender: :user_profile,
                                                                       receiver: :user_profile).order(created_at: :desc)
  end

  def current_user_messages_with(receiver)
    @messages = current_user.messages_with(receiver).order(created_at: :asc)
  end
end
