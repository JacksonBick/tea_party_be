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

# Customers
customer1 = Customer.create!(first_name: "Alice", last_name: "Wonderland", email: "alice@gmail.com", address: "123 Tea Street")
customer2 = Customer.create!(first_name: "Jackson", last_name: "Bickler", email: "jbickler4@gmail.com", address: "456 Hammer Ave")
customer3 = Customer.create!(first_name: "Charlie", last_name: "Chocolate", email: "charlie@example.com", address: "789 Cocoa Blvd")
customer4 = Customer.create!(first_name: "Luna", last_name: "Moon", email: "luna@example.com", address: "101 Galaxy Way")
customer5 = Customer.create!(first_name: "Miles", last_name: "Davis", email: "miles@example.com", address: "102 Jazz Ave")
customer6 = Customer.create!(first_name: "Nina", last_name: "Simone", email: "nina@example.com", address: "103 Soul Rd")
customer7 = Customer.create!(first_name: "Bruce", last_name: "Wayne", email: "bruce@example.com", address: "Wayne Manor")
customer8 = Customer.create!(first_name: "Clark", last_name: "Kent", email: "clark@example.com", address: "Daily Planet")
customer9 = Customer.create!(first_name: "Diana", last_name: "Prince", email: "diana@example.com", address: "Themyscira")

# Teas
tea1 = Tea.create!(title: "Earl Grey", description: "A classic black tea with bergamot.", temperature: 95, brew_time: 3, price: 4.50, image_url: "https://upload.wikimedia.org/wikipedia/commons/d/d0/Frisch_aufgebr%C3%BChter_EarlGrey_Tee.jpg")
tea2 = Tea.create!(title: "Green Jasmine", description: "Floral green tea with jasmine flowers.", temperature: 85, brew_time: 3, price: 5.25, image_url: "https://d2jx2rerrg6sh3.cloudfront.net/image-handler/picture/2021/9/shutterstock_251566309.jpg")
tea3 = Tea.create!(title: "Chamomile", description: "Herbal tea for relaxation.", temperature: 90, brew_time: 4, price: 3.75, image_url: "https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/chamomile-tea.jpg?w=1155&h=1528")
tea4 = Tea.create!(title: "Peppermint", description: "Fresh peppermint leaves.", temperature: 95, brew_time: 5, price: 4.00, image_url: "https://cdn-prod.medicalnewstoday.com/content/images/articles/325/325242/peppermint-tea.jpg")
tea5 = Tea.create!(title: "Lemon Ginger", description: "Zesty lemon with warming ginger.", temperature: 90, brew_time: 4, price: 4.25, image_url: "https://sakiproducts.com/cdn/shop/articles/20230223085019-lemon-ginger-tea-recipe-blog_1200x1200.webp?v=1677142229")
tea6 = Tea.create!(title: "Hibiscus", description: "Tart and vibrant floral tea.", temperature: 95, brew_time: 5, price: 3.95, image_url: "https://cdn.loveandlemons.com/wp-content/uploads/2023/05/hibiscus-tea.jpg")
tea7 = Tea.create!(title: "Matcha", description: "Powdered green tea with a kick.", temperature: 80, brew_time: 2, price: 6.50, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGQlWsntL-1T2wg3TeIYh4vCj4OyxURil_zQ&s")
tea8 = Tea.create!(title: "Chai", description: "Spiced black tea blend.", temperature: 100, brew_time: 5, price: 5.00, image_url: "https://withsweethoney.com/wp-content/uploads/2024/08/vanilla-chai-tea-hero.jpg")
tea9 = Tea.create!(title: "Rooibos", description: "South African red bush tea.", temperature: 95, brew_time: 5, price: 4.30, image_url: "https://shop.equalexchange.coop/cdn/shop/products/13308_Rooibos-02.jpg?v=1670505850&width=480")

# Subscriptions
subscription1 = Subscription.create!(title: "Morning Boost", status: :active, frequency: "Monthly")
subscription2 = Subscription.create!(title: "Evening Relaxation", status: :active, frequency: "Weekly")
subscription3 = Subscription.create!(title: "All Day Energy", status: :cancelled, frequency: "Monthly")
subscription4 = Subscription.create!(title: "Detox Deluxe", status: :active, frequency: "Monthly")
subscription5 = Subscription.create!(title: "Bedtime Bliss", status: :cancelled, frequency: "Weekly")
subscription6 = Subscription.create!(title: "Green Power", status: :active, frequency: "Biweekly")
subscription7 = Subscription.create!(title: "Winter Warmers", status: :active, frequency: "Monthly")
subscription8 = Subscription.create!(title: "Summer Coolers", status: :cancelled, frequency: "Weekly")
subscription9 = Subscription.create!(title: "Antioxidant Allstars", status: :active, frequency: "Monthly")

# CustomerSubscriptions
CustomerSubscription.create!(customer: customer1, subscription: subscription1)
CustomerSubscription.create!(customer: customer2, subscription: subscription1)

CustomerSubscription.create!(customer: customer3, subscription: subscription2)
CustomerSubscription.create!(customer: customer4, subscription: subscription2)

CustomerSubscription.create!(customer: customer5, subscription: subscription3)
CustomerSubscription.create!(customer: customer6, subscription: subscription3)

CustomerSubscription.create!(customer: customer7, subscription: subscription4)
CustomerSubscription.create!(customer: customer8, subscription: subscription4)

CustomerSubscription.create!(customer: customer9, subscription: subscription5)
CustomerSubscription.create!(customer: customer1, subscription: subscription5)

CustomerSubscription.create!(customer: customer2, subscription: subscription6)
CustomerSubscription.create!(customer: customer3, subscription: subscription6)

CustomerSubscription.create!(customer: customer4, subscription: subscription7)
CustomerSubscription.create!(customer: customer5, subscription: subscription7)

CustomerSubscription.create!(customer: customer6, subscription: subscription8)
CustomerSubscription.create!(customer: customer7, subscription: subscription8)

CustomerSubscription.create!(customer: customer8, subscription: subscription9)
CustomerSubscription.create!(customer: customer9, subscription: subscription9)

# TeaSubscriptions
TeaSubscription.create!(subscription: subscription1, tea: tea1)
TeaSubscription.create!(subscription: subscription1, tea: tea2)
TeaSubscription.create!(subscription: subscription1, tea: tea3)

TeaSubscription.create!(subscription: subscription2, tea: tea4)
TeaSubscription.create!(subscription: subscription2, tea: tea5)
TeaSubscription.create!(subscription: subscription2, tea: tea6)

TeaSubscription.create!(subscription: subscription3, tea: tea2)
TeaSubscription.create!(subscription: subscription3, tea: tea7)
TeaSubscription.create!(subscription: subscription3, tea: tea8)

TeaSubscription.create!(subscription: subscription4, tea: tea3)
TeaSubscription.create!(subscription: subscription4, tea: tea5)
TeaSubscription.create!(subscription: subscription4, tea: tea9)

TeaSubscription.create!(subscription: subscription5, tea: tea1)
TeaSubscription.create!(subscription: subscription5, tea: tea6)
TeaSubscription.create!(subscription: subscription5, tea: tea8)

TeaSubscription.create!(subscription: subscription6, tea: tea4)
TeaSubscription.create!(subscription: subscription6, tea: tea2)
TeaSubscription.create!(subscription: subscription6, tea: tea7)

TeaSubscription.create!(subscription: subscription7, tea: tea9)
TeaSubscription.create!(subscription: subscription7, tea: tea8)
TeaSubscription.create!(subscription: subscription7, tea: tea6)

TeaSubscription.create!(subscription: subscription8, tea: tea1)
TeaSubscription.create!(subscription: subscription8, tea: tea3)
TeaSubscription.create!(subscription: subscription8, tea: tea4)

TeaSubscription.create!(subscription: subscription9, tea: tea5)
TeaSubscription.create!(subscription: subscription9, tea: tea7)
TeaSubscription.create!(subscription: subscription9, tea: tea9)