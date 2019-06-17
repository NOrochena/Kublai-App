# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %w[show edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to @user
  end

  def edit; end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
