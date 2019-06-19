# frozen_string_literal: true

class CollaboratorsController < ApplicationController
  def create
    @collaborator = Collaborator.new(post_id: params[:post_id], user_id: params[:user_id])
    if @collaborator.valid?
      @collaborator.save
      redirect_to post_path(@collaborator.post)
    else
      flash[:notice] = @collaborator.errors.full_messages.join(' ')
      redirect_to post_path(@collaborator.post)
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @collaborator.destroy
    redirect_back(fallback_location: posts_path)
  end
end
