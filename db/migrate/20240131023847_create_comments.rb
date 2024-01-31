# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, foreign_key: true, index: true, null: false
      t.belongs_to :tweet, foreign_key: true, index: true, null: false
      t.string :comment, limit: 140, null: false

      t.timestamps
    end
  end
end
