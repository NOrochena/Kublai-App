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
    @category = Category.new(name: downcase_name)
    if @category.valid?
      @category.save
      redirect_to category_path(@category.name)
    else
      flash[:notice] = @category.errors.full_messages.join(' ')
      redirect_back(fallback_location: categories_path)
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
