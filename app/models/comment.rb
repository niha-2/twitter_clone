# frozen_string_literal: true

class Comment < ApplicationRecord
  include FormatDateTime
  include Notifyable
  belongs_to :tweet
  belongs_to :user
  validates :comment, presence: true, length: { maximum: 140 }
end
