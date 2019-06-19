# frozen_string_literal: true

class Collaborator < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post_id, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :post_id, message: 'Already Collaborating on this project.' }
end
