# frozen_string_literal: true

class AddProfilesToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :name, null: false, default: 'user'
      t.string :self_introduction
      t.string :place
      t.string :website
    end
  end
end
