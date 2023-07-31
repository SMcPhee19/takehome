class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else
      render json: { error: subscription.errors.full_messages.to_sentence }, status: 400
    end
  end

  def cancel
    subscription = Subscription.find(params[:subscription_id])
    subscription.update!(status: 'cancelled')
  end

  private

  def subscription_params
    params.permit(:customer_id, :tea_id, :frequency, :status, :price, :title)
  end
end
