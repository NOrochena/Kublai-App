# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :comments, dependent: :destroy
  has_many :posts, through: :comments
  has_many :posts, dependent: :destroy
  has_many :collaborators, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :categories, through: :subscriptions

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
