class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.references :user, foreigh_key: true, index: true
      t.string :tweet, limit: 140, null: false

      t.timestamps
    end
  end
end
