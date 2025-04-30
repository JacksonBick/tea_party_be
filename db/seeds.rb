# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
CustomerSubscription.destroy_all
TeaSubscription.destroy_all
Subscription.destroy_all
Tea.destroy_all
Customer.destroy_all

customer1 = Customer.create!(first_name: "Alice", last_name: "Wonderland", email: "alice@gmail.com", address: "123 Tea Street")
customer2 = Customer.create!(first_name: "Jackson", last_name: "Bickler", email: "jbickler4@gmail.com", address: "456 Hammer Ave")
customer3 = Customer.create!(first_name: "Charlie", last_name: "Chocolate", email: "charlie@example.com", address: "789 Cocoa Blvd")

tea1 = Tea.create!(
  title: "Earl Grey",
  description: "A classic black tea with bergamot.",
  temperature: 95,
  brew_time: 3,
  price: 4.50,
  image_url: "https://upload.wikimedia.org/wikipedia/commons/d/d0/Frisch_aufgebr%C3%BChter_EarlGrey_Tee.jpg"
)
tea2 = Tea.create!(
  title: "Green Jasmine",
  description: "Floral green tea with jasmine flowers.",
  temperature: 85,
  brew_time: 3,
  price: 5.25,
  image_url: "https://d2jx2rerrg6sh3.cloudfront.net/image-handler/picture/2021/9/shutterstock_251566309.jpg"
)
tea3 = Tea.create!(
  title: "Chamomile",
  description: "Herbal tea for relaxation.",
  temperature: 90,
  brew_time: 4,
  price: 3.75,
  image_url: "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/chamomile-tea.jpg?w=1155&h=1528"
)
tea4 = Tea.create!(
  title: "Peppermint",
  description: "Fresh peppermint leaves.",
  temperature: 95,
  brew_time: 5,
  price: 4.00,
  image_url: "https://cdn-prod.medicalnewstoday.com/content/images/articles/325/325242/peppermint-tea.jpg"
)

subscription1 = Subscription.create!(title: "Morning Boost", status: :active, frequency: "Monthly")
subscription2 = Subscription.create!(title: "Evening Relaxation", status: :active, frequency: "Weekly")
subscription3 = Subscription.create!(title: "All Day Energy", status: :cancelled, frequency: "Monthly")

CustomerSubscription.create!(customer: customer1, subscription: subscription1)
CustomerSubscription.create!(customer: customer2, subscription: subscription1)
CustomerSubscription.create!(customer: customer3, subscription: subscription2)
CustomerSubscription.create!(customer: customer1, subscription: subscription3)
CustomerSubscription.create!(customer: customer2, subscription: subscription3)

TeaSubscription.create!(subscription: subscription1, tea: tea1) # Earl Grey
TeaSubscription.create!(subscription: subscription1, tea: tea2) # Green Jasmine
TeaSubscription.create!(subscription: subscription2, tea: tea3) # Chamomile
TeaSubscription.create!(subscription: subscription3, tea: tea1) # Earl Grey
TeaSubscription.create!(subscription: subscription3, tea: tea4) # Pepper