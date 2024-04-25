# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_latest_messages, only: %i[index]
  after_action :latest_receiver_messages, only: %i[index]

  # 送信者ごとに最新のメッセージを取得
  def index
  end

  private

  def set_latest_messages
    p '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    latest_messages_ids = current_user.latest_messages_ids
    @latest_messages = Message.where(id: latest_messages_ids).includes(sender: [:user_profile],
                                                               receiver: [:user_profile]).order(created_at: :desc)
    p '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
  end

  def current_user_messages_with(receiver)
    @messages = current_user.messages_with(receiver).order(created_at: :asc)
  end

  # やり取りしたユーザーの中で最もやり取りが新しい人とのメッセージを取得
  def latest_receiver_messages
    p '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    p @latest_messages
    if @latest_messages.present?
      @receiver = if @latest_messages.first.receiver_id == current_user.id
                    @latest_messages.first.sender
                  else
                    @latest_messages.first.receiver
                  end
      p @receiver
      p '????????????????????????????'
      current_user_messages_with(@receiver)
    end
    p '\\\\\\\\\\\\\\\\\\\\\\\\\\\\'
    p @messages
  end
end
