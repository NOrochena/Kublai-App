# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :post_tags
  has_many :posts

  validates :name, presence: true
end
