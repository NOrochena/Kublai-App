class SubscriptionsController < ApplicationController

  # after_action :reload_categories, only: [:create, :destroy, :toggle_subscription]

  helper_method :toggle_subscription
  def toggle_subscription
    redirect_back(fallback_location: categories_path)
  end

  def create
    @subscription = Subscription.create(category_id: params[:category_id], user_id: params[:user_id])
    redirect_back(fallback_location: categories_path)
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    redirect_back(fallback_location: categories_path)
  end

  private

  def reload_categories
    redirect_back(fallback_location: categories_path)
  end

  # def subscription_params
  #   params.require(:subscription).permit(:category_id, :user_id)
  # end

end
