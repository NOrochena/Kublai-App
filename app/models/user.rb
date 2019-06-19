# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :posts, through: :comments
  has_many :posts
  has_many :collaborators
end
