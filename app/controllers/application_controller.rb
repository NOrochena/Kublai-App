# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :find_current_user, :logged_in?

  def index
    @posts = Post.search(params[:id], params[:search]).sort { |a, b| b.created_at <=> a.created_at }
  end

  def find_current_user
    @user = User.find(session['user_id']) if session['user_id']
  end

  def logged_in?
    session['user_id']
  end

  private

  # def authorized
  #   redirect_to login_path unless logged_in?
  # end

  def require_login
    redirect_to login_path unless session.include? 'user_id'
  end

  def require_login_post
    redirect_to login_path unless session['user_id'] == @post.user_id
  end

  def require_login_user
    redirect_to login_path unless session['user_id'] == @user.id
  end

  def require_login_comment
    redirect_to login_path unless session['user_id'] == @comment.user_id
  end
end
