# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :posts, through: :comments
  has_many :posts
  has_many :collaborators

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
