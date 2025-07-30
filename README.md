# Tea Party Backend

This is the Ruby on Rails API backend for my Tea Party subscription app. It handles all the data around teas, customers, and subscriptions, and exposes RESTful endpoints to support the frontend.

---

## Features

- Customers and teas can both belong to multiple subscriptions
- Real-time total price calculation based on included teas
- Ability to exclude teas from pricing without deleting them
- PATCH endpoints to cancel or reactivate a subscription
- Nested JSON responses including associated teas and customers
- Seed data includes image URLs and randomized prices for each tea

---

## Project Overview

The backend supports a dynamic pricing setup where the total subscription price updates based on which teas are currently "active" — without needing to remove teas from the subscription entirely. I set it up this way so the user experience stays fast and smooth, while also leaving room to softly advertise new teas to customers.

Everything is exposed through JSON APIs built to work with a React frontend. Subscriptions support:

- Filtering teas by max price
- Dynamically toggling which teas count toward the price
- Changing status (active or cancelled)

---

## Planning & Implementation

### Goals

- Keep models clean and relationships straightforward
- Make price and filtering logic dynamic and frontend-driven
- Write code that’s easy to follow but still gets everything done

### What I Did

- Built custom methods on the `Subscription` model for:
  - Calculating price based on included teas
  - Excluding teas without deleting associations
- Wrote dynamic seed data with random pricing and image URLs
- Used serializers to return clean nested JSON
- Reached 100% test coverage using RSpec

---

## Challenges & Wins

- Getting the tea images to match the right teas felt amazing once it finally worked
- Connecting the frontend and backend and seeing it all come together smoothly was a big highlight
- I used as few files as possible while keeping things organized and readable — which I’m proud of
- 100% test coverage! I know there are ways to fake that, but I actually tested all the real user-facing logic with strong unit tests

> Just a heads-up: I had to create a new repo for this backend after losing the original on GitHub. Thankfully, I still had everything locally, but that’s why this one doesn’t have a full commit or migration history.

---

## Getting Started

To run locally:

```bash
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

Related Repositories
Frontend repo: https://github.com/JacksonBick/tea-party-fe

pgsql
Copy
Edit
