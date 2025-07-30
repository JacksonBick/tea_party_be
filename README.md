Tea Party Backend
A RESTful Rails API that powers a dynamic tea subscription service with customizable pricing, clean data structures, and full CRUD functionality.

Features
Customers and teas can be part of multiple subscriptions

Real-time total price calculation based on selected teas

Ability to exclude teas from price calculation without deleting them

PATCH endpoints to cancel or reactivate a subscription

Nested JSON responses including associated teas and customers

Seed data with image URLs and randomized prices for each tea

Project Overview
The backend supports a dynamic pricing model where the total subscription cost is calculated from the prices of activated teas — without removing any teas from the subscription. This allows for a fast, user-friendly experience while also subtly promoting new teas to customers.

Subscriptions are exposed via JSON APIs designed for a React frontend, and support:

Filtering teas by max price

Dynamically toggling tea inclusion in the price calculation

Updating subscription status (active or cancelled)

Planning & Implementation
Goals
Keep models tightly focused and relationships clearly defined

Support dynamic, frontend-driven filtering and calculation

Maintain readable, concise code while delivering full functionality

Design Decisions
Built custom instance methods on the Subscription model to handle:

Dynamic total price calculation

Tea exclusions without removing relationships

Created dynamic seed data with randomized pricing and image URLs

Used serializers to deliver clean, nested JSON for the frontend

Maintained 100% test coverage with RSpec

Challenges & Wins
Successfully associating dynamic tea images with the correct teas was a major technical win

Connecting the backend to the React frontend and seeing the application run smoothly was highly rewarding

Maintained a minimal yet organized file structure for clarity and efficiency

Achieved complete test coverage — not just for appearance, but with thorough unit tests validating all functionality

Note: This repository was recreated after the original was lost on GitHub. Since the project still existed locally, the codebase is fully intact, but the commit and migration history are not preserved.

Getting Started
To run locally:
bash
Copy
Edit
git clone git@github.com:JacksonBick/tea_party_be.git  
cd tea_party_be  
bundle install  
rails db:{create,migrate,seed}  
rails s  
To run tests:
bash
Copy
Edit
bundle exec rspec spec
Tech Stack
Ruby on Rails

PostgreSQL

RSpec for testing

Fast JSON API for serialization

Related Repository
Frontend: https://github.com/JacksonBick/tea-party-fe


