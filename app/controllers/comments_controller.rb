# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_comment, only: %w[edit update destroy]

  def create
    @comment = Comment.new(content: params[:content], user_id: session['user_id'], post_id: params[:post_id])
    @comment.save
    redirect_to post_path(@comment.post)
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
