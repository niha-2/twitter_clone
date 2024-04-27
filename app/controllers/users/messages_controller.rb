# frozen_string_literal: true

module Users
  class MessagesController < ApplicationController
    before_action :set_latest_messages, only: %i[index]
    before_action :set_receiver, only: %i[index create]

    # 特定のユーザーとのメッセージを表示
    def index
      return unless current_user.message_with?(@receiver)

      current_user_messages_with(@receiver)
    end

    # メッセージを送信
    def create
      @message = Message.new(sender_id: current_user.id, receiver_id: @receiver.id, content: params[:content])
      if @message.save
        redirect_back(fallback_location: user_messages_path(@receiver))
      else
        redirect_back(fallback_location: user_messages_path(@receiver), alert: 'メッセージの送信に失敗しました')
      end
    end

    private

    def set_latest_messages
      latest_messages_ids = current_user.latest_messages_ids
      @latest_messages = Message.where(id: latest_messages_ids).includes(sender: [:user_profile],
                                                                         receiver: [:user_profile]).order(created_at: :desc)
    end

    def set_receiver
      @receiver = User.find(params[:user_id])
    end

    def current_user_messages_with(receiver)
      @messages = current_user.messages_with(receiver).order(created_at: :asc)
    end
  end
end
