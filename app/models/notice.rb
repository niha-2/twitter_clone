# frozen_string_literal: true

class Notice < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
end
