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

  def self.most_comments
    all.max do |a, b|
      a.comments.count <=> b.comments.count
    end
  end

  def self.least_comments
    all.min do |a, b|
      a.comments.count <=> b.comments.count
    end
  end

  def self.most_collaborators
    all.max do |a, b|
      a.collaborators.count <=> b.collaborators.count
    end
  end

  def self.least_collaborators
    all.min do |a, b|
      a.collaborators.count <=> b.collaborators.count
    end
  end
end
