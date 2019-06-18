# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :find_current_user

  def find_current_user
    @user = User.find(session['user_id']) if session['user_id']
  end

  private

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
