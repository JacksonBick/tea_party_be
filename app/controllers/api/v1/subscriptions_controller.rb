class Api::V1::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :update]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def index
    subscriptions = Subscription.all
    render json: subscriptions, include: [:customer, :teas]
  end

  def show
    render json: @subscription, include: [:customer, :teas]
  end

  def update
    subscription = Subscription.find(params[:id])
  
    if params.key?(:cancel)
      subscription.cancelled!
      render json: { message: "Subscription cancelled successfully." }, status: :ok
    elsif params.key?(:active)
      subscription.active!
      render json: { message: "Subscription reactivated successfully." }, status: :ok
    else
      if subscription.update(subscription_params)
        render json: subscription, status: :ok
      else
        raise ActiveRecord::RecordInvalid.new(subscription)
      end
    end
  end

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:title, :price, :status, :frequency)
  end

  def record_not_found
    render json: { error: "Subscription not found" }, status: :not_found
  end

  def parameter_missing
    render json: { error: "Required parameters missing" }, status: :bad_request
  end

  def record_invalid(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
