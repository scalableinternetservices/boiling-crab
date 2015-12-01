# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Friendship.delete_all
Comment.delete_all
Post.delete_all
User.delete_all

require 'faker'

number_of_users = 10
number_of_posts_per_user = 10
number_of_comments_per_post = 10


u1 = User.create(first_name: 'Ziqiang', last_name: 'Shi', email: 'a@a', password: 'a', password_confirmation: 'a',
	nFollowing: 2, nFollower: 2, nPost: 2, nSold: 0, image: File.open("#{Rails.root}/public/images/users/user1.jpg"))
u2 = User.create(first_name: 'Shijian', last_name: 'Zheng', email: 'b@b', password: 'b', password_confirmation: 'b',
	nFollowing: 2, nFollower: 2, nPost: 2, nSold: 0, image: File.open("#{Rails.root}/public/images/users/user2.jpg"))
u3 = User.create(first_name: 'Kai', last_name: 'Wang', email: 'c@c', password: 'c', password_confirmation: 'c',
	nFollowing: 2, nFollower: 2, nPost: 2,  nSold: 0, image: File.open("#{Rails.root}/public/images/users/user3.jpg"))
u4 = User.create(first_name: 'Yu', last_name: 'Xie', email: 'd@d', password: 'd', password_confirmation: 'd',
	nFollowing: 2, nFollower: 2, nPost: 2,  nSold: 0, image: File.open("#{Rails.root}/public/images/users/user4.jpg"))


number_of_users.times do
  # Create new random user.
  fake_password = Faker::Internet.password
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
    email: Faker::Internet.email, password: fake_password, password_confirmation: fake_password,
    nFollowing: 0, nFollower: 0, nPost: number_of_posts_per_user, nSold: 0,
    image: File.open("#{Rails.root}/public/images/question_mark.jpg"))

  # Create new friendship.
  Friendship.create(user_id: u1.id, friend_id: user.id)

  number_of_posts_per_user.times do
    # Create new random post.
    post = Post.create(title: Faker::Lorem.word, description: Faker::Lorem.sentence,
      price: Faker::Number.number(3), user_id: user.id, sell_to: -1,
      image: File.open("#{Rails.root}/public/images/question_mark.jpg"))

    # Create random comments for each random post.
    number_of_comments_per_post.times do
      Comment.create(commender_id: 1, body: Faker::Lorem.sentence, post_id: post.id)
    end
  end
end

Friendship.create(user_id: u1.id, friend_id: u2.id)
Friendship.create(user_id: u1.id, friend_id: u3.id)
Friendship.create(user_id: u2.id, friend_id: u3.id)
Friendship.create(user_id: u2.id, friend_id: u4.id)
Friendship.create(user_id: u3.id, friend_id: u4.id)
Friendship.create(user_id: u3.id, friend_id: u1.id)
Friendship.create(user_id: u4.id, friend_id: u1.id)
Friendship.create(user_id: u4.id, friend_id: u2.id)

p1 = Post.create(title: 'chair', description: 'This is the best second-handed chair!',
	price: 10, user_id: u1.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/posts/chair.jpg"))
p2 = Post.create(title: 'table', description: 'This is the best second-handed table!',
	price: 20, user_id: u1.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/posts/table.jpg"))
p3 = Post.create(title: 'lamp', description: 'This is the best second-handed lamp!',
	price: 15, user_id: u2.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/posts/lamp.jpg"))
p4 = Post.create(title: 'mattress', description: 'This is the most soft second-handed mattress!',
	price: 80, user_id: u2.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/posts/mattress.jpg"))
p5 = Post.create(title: 'bike', description: 'This is the coolest second-handed bike!',
	price: 100, user_id: u3.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/posts/bike.jpg"))
p6 = Post.create(title: 'car', description: 'This is the best second-handed car!',
	price: 1000, user_id: u3.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/posts/car.jpg"))
p7 = Post.create(title: 'superman', description: 'This is the most handsome second-handed superman!',
	price: 8888, user_id: u4.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/posts/superman.jpeg"))
p8 = Post.create(title: 'iphone', description: 'This is broken second-handed iphone!',
	price: 50, user_id: u4.id, sell_to: -1, image: File.open("#{Rails.root}/public/images/posts/iphone.jpg"))


Comment.create(commender_id: 1, body: 'Buy the chair!', post_id: p1.id)
Comment.create(commender_id: 4, body: 'The chair looks so old.', post_id: p1.id)
Comment.create(commender_id: 2, body: 'Come buy my lamp!', post_id: p3.id)
Comment.create(commender_id: 1, body: 'What a ugly lamp.', post_id: p3.id)
Comment.create(commender_id: 3, body: 'My bike is so cool!', post_id: p5.id)
Comment.create(commender_id: 2, body: 'I like it.', post_id: p5.id)
Comment.create(commender_id: 4, body: 'It still works even it is broken.', post_id: p7.id)
Comment.create(commender_id: 3, body: 'Keep it for me.', post_id: p7.id)
