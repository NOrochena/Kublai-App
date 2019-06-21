# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments
  belongs_to :category
  belongs_to :user
  belongs_to :tag
  has_many :collaborators

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  validates :tag_id, presence: true
  validates :category_id, presence: true

  def self.search(user, search)
    if user != '' && search == 'subscription'
      user = User.find(user)
      category_ids = user.categories.map(&:id)
      Post.where(category_id: category_ids)
    else
      all
    end
  end

  def self.most_comments
    all.max do |a, b|
      a.comments.count <=> b.comments.count
    end
  end

  def self.most_collaborators
    all.max do |a, b|
      a.collaborators.count <=> b.collaborators.count
    end
  end

  def self.most_recent_post
    order(:created_at).last
  end

  def self.longest_title
    order('length(title) desc').first
  end

  def self.longest_content
    order('length(content) desc').first
  end
end
