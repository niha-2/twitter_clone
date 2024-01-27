# frozen_string_literal: true

class Tweet < ApplicationRecord
  validates :tweet, presence: true, length: { maximum: 100 }
end
