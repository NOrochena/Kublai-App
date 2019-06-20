# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy tables
Category.destroy_all
User.destroy_all
Post.destroy_all
Comment.destroy_all
Tag.destroy_all
Collaborator.destroy_all

# Create Users
nick = User.create(name: 'nick', email: 'nick@email.com', password: 'password')
keith = User.create(name: 'keith', email: 'keith@email.com', password: 'password')
errol = User.create(name: 'errol', email: 'errol@email.com', password: 'password')
15.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password')
end

# Create Categories
programming = Category.create(name: 'programming')
cooking = Category.create(name: 'cooking')

# Create Tags
ruby = Tag.create(name: 'ruby')
javascript = Tag.create(name: 'javascript')
html = Tag.create(name: 'HTML')
css = Tag.create(name: 'CSS')
python = Tag.create(name: 'python')

# Create Posts
post1 = Post.create(user: nick, title: 'Ruby Programming Project', category_id: programming.id, tag: ruby, content: 'Please help me Please help me Please help me Please help me Please help me Please help me ')
post2 = Post.create(user: keith, title: 'HTML Programming Project', category_id: programming.id, tag: python, content: 'HTML HELP HTML HELP HTML HELP HTML HELP HTML HELP')
post3 = Post.create(user: errol, title: 'How to cook spaghetti?', category_id: cooking.id, tag: ruby, content: 'Please help me cook spaghetti?! Please help me cook spaghetti?! Please help me cook spaghetti?! Please help me cook spaghetti?! Please help me cook spaghetti?! Please help me cook spaghetti?! ')
15.times do
  post = Post.new(user: User.all.sample, title: Faker::Lorem.sentence(6, false, 5), category: Category.all.sample, tag: Tag.all.sample, content: Faker::Lorem.paragraph(5, true, 5))
  post.created_at = (rand * 30).days.ago
  post.save
end

# Create Comments
Comment.create(content: "I'll help", user: nick, post: post1)
Comment.create(content: "I'll help", user: keith, post: post1)
Comment.create(content: "I'll help", user: errol, post: post1)

Comment.create(content: "I'll help", user: nick, post: post2)
Comment.create(content: "I'll help", user: nick, post: post2)
Comment.create(content: "I'll help", user: keith, post: post2)

100.times do
  Comment.create(content: Faker::Lorem.sentence(2, false, 4), user: User.all.sample, post: Post.all.sample)
end

Collaborator.create(post: post1, user: keith)
Collaborator.create(post: post1, user: errol)
Collaborator.create(post: post2, user: nick)

60.times do
  Collaborator.create(post: Post.all.sample, user: User.all.sample)
end
