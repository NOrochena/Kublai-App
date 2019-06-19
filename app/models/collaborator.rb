# frozen_string_literal: true

class Collaborator < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post_id, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :post_id, message: 'Already Collaborating on this project.' }
  validate :is_post_creator?

  def is_post_creator?
    if Post.find(post_id).user.id == user_id
      errors.add(:user_id, "can't collaborate own post")
    end
  end
end
