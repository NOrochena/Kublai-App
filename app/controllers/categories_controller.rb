class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.new
  end

  def show
    @category = Category.find_by(name: params[:name])
  end

  def new
    @category = Category.new
  end

  def create
    downcase_name = params[:category][:name].downcase
    @category = Category.create(name: downcase_name)
    redirect_to category_path(@category.name)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
