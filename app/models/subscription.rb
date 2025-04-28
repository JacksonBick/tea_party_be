class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :tea_subscriptions, dependent: :destroy
  has_many :teas, through: :tea_subscriptions

  enum status: { active: 0, cancelled: 1 }

  validates :title, :price, :frequency, presence: true
  validates :status, inclusion: { in: statuses.keys }
end
