class Subscription < ApplicationRecord
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions

  has_many :tea_subscriptions, dependent: :destroy
  has_many :teas, through: :tea_subscriptions

  enum status: { active: 1, cancelled: 0 }

  validates :title, :frequency, presence: true
  validates :status, inclusion: { in: statuses.keys }

  def total_price(excluded_tea_ids = [])
    teas.where.not(id: excluded_tea_ids).sum(:price)
  end
end