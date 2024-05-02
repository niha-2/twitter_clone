# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# user
user1 = User.new(
  email: 'gen.5polym.hn@gmail.com',
  user_name: 'example1',
  phone_number: '00000000000',
  date_of_birth: Time.zone.today,
  password: '111111',
  uid: '111111111'
)

user1.save!

user_profile1 = UserProfile.new(
  user_id: 1,
  name: '田中',
  self_introduction: '初めまして',
  place: '東京都',
  website: 'https://example1.com'
)
user_profile1.icon_image.attach(io: File.open('app/assets/images/tako.JPG'), filename: 'tako.JPG')
user_profile1.header_image.attach(io: File.open('app/assets/images/oden.JPG'), filename: 'oden.JPG')
user_profile1.save!

user2 = User.new(
  email: 'gen.2polym.hn@gmail.com',
  user_name: 'example2',
  phone_number: '00000000000',
  date_of_birth: Time.zone.today,
  password: '222222',
  uid: '222222222'
)
user2.save!

user_profile2 = UserProfile.new(
  user_id: 2,
  name: 'よしー',
  self_introduction: 'twice沼',
  place: '岐阜県',
  website: 'https://example2.com'
)
user_profile2.icon_image.attach(io: File.open('app/assets/images/kishi.JPG'), filename: 'kishi.JPG')
user_profile2.header_image.attach(io: File.open('app/assets/images/tako.JPG'), filename: 'tako.JPG')
user_profile2.save!

user3 = User.new(
  email: 'gen.3polym.hn@gmail.com',
  user_name: 'example3',
  phone_number: '00000000000',
  date_of_birth: Time.zone.today,
  password: '333333',
  uid: '333333333'
)
user3.save!

user_profile3 = UserProfile.new(
  user_id: 3,
  name: 'みくり',
  self_introduction: 'ミックスジュースが好きです',
  place: '神奈川県',
  website: 'https://example3.com'
)
user_profile3.icon_image.attach(io: File.open('app/assets/images/hokkaido.JPG'), filename: 'hokkaido.JPG')
user_profile3.header_image.attach(io: File.open('app/assets/images/tako.JPG'), filename: 'tako.JPG')
user_profile3.save!

user4 = User.new(
  email: 'gen.4polym.hn@gmail.com',
  user_name: 'example4',
  phone_number: '00000000000',
  date_of_birth: Time.zone.today,
  password: '444444',
  uid: '444444444'
)
user4.save!

user_profile4 = UserProfile.new(
  user_id: 4,
  name: 'まよねーず',
  self_introduction: 'だんご3兄弟',
  place: '福岡県',
  website: 'https://example4.com'
)
user_profile4.icon_image.attach(io: File.open('app/assets/images/oden.JPG'), filename: 'oden.JPG')
user_profile4.header_image.attach(io: File.open('app/assets/images/hokkaido.JPG'), filename: 'hokkaido.JPG')
user_profile4.save!

# tweet
tweet1 = Tweet.new(
  user_id: 1,
  tweet: 'ふるさと納税のもつ鍋美味しい。福岡いきたい。'
)
tweet1.save!

tweet2 = Tweet.new(
  user_id: 2,
  tweet: 'アオハライドseason2良すぎる。見てほしい～～～～～～～～～～～～～～～～～～～～～～～～～～～'
)
tweet2.save!

tweet3 = Tweet.new(
  user_id: 3,
  tweet: 'ミックスジュース飲みたい。'
)
tweet3.save!

tweet4 = Tweet.new(
  user_id: 4,
  tweet: 'だんご～～～～～。'
)
tweet4.save!

tweet5 = Tweet.new(
  user_id: 3,
  tweet: '流石にさむくない？？？？？？'
)
tweet5.save!

# follow
follow1 = Follow.new(
  follower_id: 3,
  followed_id: 1
)
follow1.save!

follow2 = Follow.new(
  follower_id: 3,
  followed_id: 2
)
follow2.save!

# like
(1..3).each do |num|
  like = Like.new(
    user_id: num,
    tweet_id: num + 1
  )
  like.save!
end

like4 = Like.new(
  user_id: 4,
  tweet_id: 1
)
like4.save!

(2..4).each do |num|
  like = Like.new(
    user_id: num,
    tweet_id: 2
  )
  like.save!
end

# retweet
(1..3).each do |num|
  retweet = Retweet.new(
    user_id: num,
    tweet_id: num + 1
  )
  retweet.save!
end

retweet4 = Retweet.new(
  user_id: 4,
  tweet_id: 1
)
retweet4.save!

(1..3).each do |num|
  retweet = Retweet.new(
    user_id: num,
    tweet_id: 1
  )
  retweet.save!
end

# comment
comment1 = Comment.new(
  user_id: 1,
  tweet_id: 2,
  comment: 'アオハライド良すぎる!!'
)
comment1.save!

comment2 = Comment.new(
  user_id: 2,
  tweet_id: 3,
  comment: '大阪'
)
comment2.save!

comment3 = Comment.new(
  user_id: 3,
  tweet_id: 4,
  comment: '？！・・・・・・・・・・'
)
comment3.save!

comment4 = Comment.new(
  user_id: 4,
  tweet_id: 1,
  comment: '飲み行こう^^'
)
comment4.save!

comment5 = Comment.new(
  user_id: 2,
  tweet_id: 1,
  comment: '俺も!！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！'
)
comment5.save!

# message
message1 = Message.new(
  sender_id: 1,
  receiver_id: 2,
  content: 'こんにちは'
)
message1.save!

message2 = Message.new(
  sender_id: 2,
  receiver_id: 3,
  content: 'こんばんは'
)
message2.save!

message3 = Message.new(
  sender_id: 3,
  receiver_id: 4,
  content: 'おはよう'
)
message3.save!

message4 = Message.new(
  sender_id: 4,
  receiver_id: 1,
  content: 'おやすみ'
)
message4.save!

message5 = Message.new(
  sender_id: 3,
  receiver_id: 1,
  content: 'おはよう'
)
message5.save!

message6 = Message.new(
  sender_id: 3,
  receiver_id: 2,
  content: 'おはよう'
)
message6.save!

message7 = Message.new(
  sender_id: 3,
  receiver_id: 4,
  content: '今日あつい'
)
message7.save!
