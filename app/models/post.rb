# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  accepts_nested_attributes_for :post_tags
end
