# frozen_string_literal: true

class Message < ApplicationRecord
  include FormatDateTime
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :content, presence: true
end
