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
  email: 'example1@gmail.com',
  user_name: 'example1',
  phone_number: '00000000000',
  date_of_birth: Time.zone.today,
  name: '田中',
  self_introduction: '初めまして',
  place: '東京都',
  website: 'https://example1.com',
  password: '111111',
  uid: '111111111'
)

user1.images.attach(io: File.open('app/assets/images/tako.JPG'), filename: 'tako.JPG')
user1.images.attach(io: File.open('app/assets/images/oden.JPG'), filename: 'oden.JPG')
user1.save!

user2 = User.new(
  email: 'example2@gmail.com',
  user_name: 'example2',
  phone_number: '00000000000',
  date_of_birth: Time.zone.today,
  name: 'よしー',
  self_introduction: 'twice沼',
  place: '岐阜県',
  website: 'https://example2.com',
  password: '222222',
  uid: '222222222'
)

user2.images.attach(io: File.open('app/assets/images/kishi.JPG'), filename: 'kishi.JPG')
user2.images.attach(io: File.open('app/assets/images/tako.JPG'), filename: 'tako.JPG')
user2.save!

user3 = User.new(
  email: 'example3@gmail.com',
  user_name: 'example3',
  phone_number: '00000000000',
  date_of_birth: Time.zone.today,
  name: 'みくり',
  self_introduction: 'ミックスジュースが好きです',
  place: '神奈川県',
  website: 'https://example3.com',
  password: '333333',
  uid: '333333333'
)

user3.images.attach(io: File.open('app/assets/images/hokkaido.JPG'), filename: 'hokkaido.JPG')
user3.images.attach(io: File.open('app/assets/images/tako.JPG'), filename: 'tako.JPG')
user3.save!

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
  user_id: 3,
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
