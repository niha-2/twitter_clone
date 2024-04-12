# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_latest_messages, only: %i[index show]
  before_action :set_receiver, only: %i[show create]

  # 送信者ごとに最新のメッセージを取得
  def index
    if @latest_messages.present?
      @receiver = if @latest_messages.first.receiver_id == current_user.id
                    @latest_messages.first.sender
                  else
                    @latest_messages.first.receiver
                  end
    end
    current_user_messages_with(@receiver)
  end

  # 特定のユーザーとのメッセージを表示
  def show
    return unless current_user.message_with?(@receiver)

    current_user_messages_with(@receiver)
  end

  # メッセージを送信
  def create
    @message = Message.new(sender_id: current_user.id, receiver_id: @receiver.id, message: params[:message])
    if @message.save
      redirect_back(fallback_location: user_messages_path(@receiver))
    else
      redirect_back(fallback_location: user_messages_path(@receiver), alert: 'メッセージの送信に失敗しました')
    end
  end

  private

  def set_latest_messages
    message_ids = current_user.current_user_messages.group('LEAST(sender_id, receiver_id)',
                                                           'GREATEST(sender_id, receiver_id)').pluck('MAX(id)')
    @latest_messages = Message.where(id: message_ids).includes(sender: [:user_profile],
                                                               receiver: [:user_profile]).order(created_at: :desc)
  end

  def set_receiver
    @receiver = User.find(params[:user_id])
  end

  def current_user_messages_with(receiver)
    @messages = current_user.messages_with(receiver).order(created_at: :asc)
  end
end
