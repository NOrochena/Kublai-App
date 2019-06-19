# frozen_string_literal: true

class CollaboratorsController < ApplicationController
  def create
    @collaborator = Collaborator.create(post_id: params[:post_id], user_id: params[:user_id])
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @collaborator.destroy
    redirect_back(fallback_location: posts_path)
  end
end
