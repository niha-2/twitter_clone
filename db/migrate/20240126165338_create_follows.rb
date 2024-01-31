# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.belongs_to :follower, class_name: 'User', foreigh_key: true, index: false, null: false
      t.belongs_to :followed, class_name: 'User', foreigh_key: true, index: false, null: false
      t.timestamps
    end

    add_index :follows, [:follower_id, :followed_id], unique: true
  end
end
