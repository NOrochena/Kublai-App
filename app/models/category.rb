# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts
  has_many :subscriptions
  has_many :users, through: :subscriptions
  validates :name, uniqueness: true, presence: true

  def subscribers
    users
  end
end
