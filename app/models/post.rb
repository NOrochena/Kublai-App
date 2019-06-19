# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments
  belongs_to :user
  belongs_to :tag
  has_many :collaborators
end
