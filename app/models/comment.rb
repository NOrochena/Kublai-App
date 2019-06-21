# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true

  def self.longest_comment
    all.max do |a, b|
      a.content.length <=> b.content.length
    end
  end

  def self.most_unique_characters_in_comment
    all.max do |a, b|
      a.content.chars.to_a.uniq <=> b.content.chars.to_a.uniq
    end
  end
end
