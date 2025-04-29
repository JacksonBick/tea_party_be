require 'rails_helper'

RSpec.describe "Api::V1::Subscriptions", type: :request do
  before(:each) do
    @customer = Customer.create!(
      first_name: "Jackson",
      last_name: "Bickler",
      email: "bruh.gmail@example.com",
      address: "Tea Street"
    )

    @tea = Tea.create!(
      title: "Green Tea",
      description: "A refreshing green tea.",
      temperature: 80,
      brew_time: 3
    )

    @subscription = Subscription.create!(
      title: "Monthly Green Tea Subscription",
      price: 19.99,
      status: 0,
      frequency: "monthly",
      customer: @customer
    )

    TeaSubscription.create!(subscription: @subscription, tea: @tea)
  end

  describe "GET /api/v1/subscriptions" do
    it "returns all subscriptions" do
      get "/api/v1/subscriptions"

      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body.first["title"]).to eq(@subscription.title)
    end
  end

  describe "GET /api/v1/subscriptions/:id" do
    it "returns a single subscription with customer and teas" do
      get "/api/v1/subscriptions/#{@subscription.id}"

      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body["title"]).to eq(@subscription.title)
      expect(body["customer"]["first_name"]).to eq(@customer.first_name)
      expect(body["teas"].first["title"]).to eq(@tea.title)
    end

    it "returns 404 if subscription not found" do
      get "/api/v1/subscriptions/99"

      expect(response).to have_http_status(:not_found)
      body = JSON.parse(response.body)
      expect(body["error"]).to eq("Subscription not found")
    end
  end

  describe "PATCH /api/v1/subscriptions/:id" do
    it "cancels a subscription with ?cancel param" do
      patch "/api/v1/subscriptions/#{@subscription.id}?cancel"

      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body["message"]).to eq("Subscription cancelled successfully.")
      expect(@subscription.reload.status).to eq("cancelled")
    end

    it "reactivates a subscription with ?active param" do
      @subscription.update(status: "cancelled")

      patch "/api/v1/subscriptions/#{@subscription.id}?active"

      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body["message"]).to eq("Subscription reactivated successfully.")
      expect(@subscription.reload.status).to eq("active")
    end

    it "updates subscription attributes normally" do
      patch "/api/v1/subscriptions/#{@subscription.id}", params: {
        subscription: { title: "New title" }
      }

      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body["title"]).to eq("New title")
      expect(@subscription.reload.title).to eq("New title")
    end

    it "returns an error if update fails" do
      patch "/api/v1/subscriptions/#{@subscription.id}", params: {
        subscription: { price: nil } 
      }

      expect(response).to have_http_status(:unprocessable_entity)
      body = JSON.parse(response.body)
      expect(body["errors"]).to include("Price can't be blank")
    end

    it "returns an error if required params are missing" do
      patch "/api/v1/subscriptions/#{@subscription.id}"
    
      expect(response).to have_http_status(:bad_request)
      body = JSON.parse(response.body)
      expect(body["error"]).to eq("Required parameters missing")
    end
  end
end