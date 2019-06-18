# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: %w[show edit update destroy]
  before_action :require_login_post, only: %i[edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
    @post.post_tags.build
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.find(session['user_id'])
    @post.save
    redirect_to @post
  end

  def edit; end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, post_tags_attributes: [:tag_id])
  end
end
