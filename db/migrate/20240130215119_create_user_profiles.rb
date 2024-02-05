# frozen_string_literal: true

class CreateUserProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_profiles do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.string :name, null: false, default: 'user'
      t.string :self_introduction
      t.string :place
      t.string :website

      t.timestamps
    end
  end
end
