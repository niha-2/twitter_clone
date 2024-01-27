# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.belongs_to :follower, class_name: 'User', foreigh_key: true, index: true
      t.belongs_to :followed, class_name: 'User', foreigh_key: true, index: true
      t.timestamps
    end
  end
end
