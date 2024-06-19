# frozen_string_literal: true

class Retweet < ApplicationRecord
  include Notifyable
  belongs_to :user
  belongs_to :tweet
end
