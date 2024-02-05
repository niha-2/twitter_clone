# frozen_string_literal: true

class UserProfile < ApplicationRecord
  has_one_attached :icon_image
  has_one_attached :header_image

  validates :name, presence: true, length: { maximum: 50 }
end
