require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:frequency) }
  end

  describe 'relationships' do
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:customers).through(:customer_subscriptions) }
    it { should have_many(:tea_subscriptions).dependent(:destroy) }
    it { should have_many(:teas).through(:tea_subscriptions) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values({ cancelled: 0, active: 1 }) }
  end

  describe '#total_price' do
  before(:each) do
    @tea1 = Tea.create!(title: "Tea 1", description: "desc", temperature: 80, brew_time: 2, price: 5.0)
    @tea2 = Tea.create!(title: "Tea 2", description: "desc", temperature: 80, brew_time: 2, price: 3.5)
    @subscription = Subscription.create!(title: "Test", frequency: "weekly", status: "active")
    @subscription.teas << [@tea1, @tea2]
  end

  it "calculates the total price of all activated teas" do
    expect(@subscription.total_price).to eq(8.5)
  end

  it "excludes specified tea IDs from the total price" do
    expect(@subscription.total_price([@tea2.id])).to eq(5.0)
  end
end
end