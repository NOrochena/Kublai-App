class Category < ApplicationRecord
  has_many :posts
  has_many :subscriptions
  has_many :users, through: :subscriptions

  def subscribers
    self.users
  end

end
