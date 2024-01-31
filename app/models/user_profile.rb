# frozen_string_literal: true

class UserProfile < ApplicationRecord
  has_many_attached :images
end
