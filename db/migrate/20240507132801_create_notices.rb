class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.integer :user_id
      t.integer :tweet_id
      t.string :action_type

      t.timestamps
    end
  end
end
