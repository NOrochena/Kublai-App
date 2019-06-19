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
end
