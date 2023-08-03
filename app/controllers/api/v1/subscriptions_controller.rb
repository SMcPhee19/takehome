class Api::V1::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end
  
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

    if subscription[:status] == 'Active'
      subscription.update!(status: 'cancelled')
      render json: SubscriptionSerializer.new(subscription), status: 200
    else
      render json: { error: 'Subscription must be active to cancel' }, status: 400
    end 
  end

  private

  def subscription_params
    params.permit(:customer_id, :tea_id, :frequency, :status, :price, :title)
  end
end
