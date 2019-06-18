# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session['user_id'] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Could not find a match for Email/Password'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
