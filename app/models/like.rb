# frozen_string_literal: true

class Like < ApplicationRecord
  include Notifyable
  belongs_to :user
  belongs_to :tweet
end
