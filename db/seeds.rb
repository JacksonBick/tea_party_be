# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
customer1 = Customer.create!(first_name: "Alice", last_name: "Wonderland", email: "alice@example.com", address: "123 Tea Street")
customer2 = Customer.create!(first_name: "Bob", last_name: "Builder", email: "bob@example.com", address: "456 Hammer Ave")
customer3 = Customer.create!(first_name: "Charlie", last_name: "Chocolate", email: "charlie@example.com", address: "789 Cocoa Blvd")

tea1 = Tea.create!(title: "Earl Grey", description: "Classic black tea with bergamot.", temperature: 95, brew_time: 5)
tea2 = Tea.create!(title: "Green Jasmine", description: "Floral green tea with jasmine flowers.", temperature: 85, brew_time: 3)
tea3 = Tea.create!(title: "Chamomile", description: "Herbal tea for relaxation.", temperature: 90, brew_time: 4)
tea4 = Tea.create!(title: "Peppermint", description: "Fresh peppermint leaves.", temperature: 95, brew_time: 5)

subscription1 = Subscription.create!(title: "Morning Boost", price: 9.99, status: :active, frequency: "Monthly", customer: customer1)
subscription2 = Subscription.create!(title: "Evening Relaxation", price: 14.99, status: :active, frequency: "Weekly", customer: customer2)
subscription3 = Subscription.create!(title: "All Day Energy", price: 19.99, status: :cancelled, frequency: "Monthly", customer: customer1)

TeaSubscription.create!(subscription: subscription1, tea: tea1) 
TeaSubscription.create!(subscription: subscription1, tea: tea2) 
TeaSubscription.create!(subscription: subscription2, tea: tea3) 
TeaSubscription.create!(subscription: subscription3, tea: tea1) 
TeaSubscription.create!(subscription: subscription3, tea: tea4)

