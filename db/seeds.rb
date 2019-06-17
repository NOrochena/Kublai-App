# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy tables
User.destroy_all
Post.destroy_all
Comment.destroy_all

# Create Users
nick = User.create(name: 'nick')
keith = User.create(name: 'keith')
errol = User.create(name: 'errol')

# Create Posts
post1 = Post.create(title: 'Ruby Programming Project', content: 'Please help me Please help me Please help me Please help me Please help me Please help me ')
post1.user = nick
post2 = Post.create(title: 'HTML Programming Project', content: 'HTML HELP HTML HELP HTML HELP HTML HELP HTML HELP')
post2.user = keith

# Create Comments
Comment.create(content: "I'll help", user: nick, post: post1)
Comment.create(content: "I'll help", user: keith, post: post1)
Comment.create(content: "I'll help", user: errol, post: post1)

Comment.create(content: "I'll help", user: nick, post: post2)
Comment.create(content: "I'll help", user: nick, post: post2)
Comment.create(content: "I'll help", user: keith, post: post2)
