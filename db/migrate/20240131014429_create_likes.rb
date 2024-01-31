class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, foreign_key: true, index: false, null: false
      t.belongs_to :tweet, foreign_key: true, index: false, null: false

      t.timestamps
    end

    add_index :likes, [:user_id, :tweet_id], unique: true
  end
end
