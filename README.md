Project Overview
The backend is a Ruby on Rails API that manages tea subscriptions, customers, and associated teas. It exposes endpoints for retrieving subscription data and modifying subscription status.

Features
Subscriptions belong to multiple teas and customers

Dynamic price calculation based on included teas

Ability to exclude teas from pricing without deletion

PATCH endpoints to cancel/reactivate subscriptions

Planning Process
The backend was designed to:

Support dynamic pricing: total_price depends on associated teas

Handle frontend-driven filtering: accepts tea IDs to exclude

Return nested JSON (subscription includes teas and customers)

I'm very happy with my backend. I definitely understand it much better and feel proud of the fact that it uses a minimal number of files, achieves 100% test coverage, and includes dynamic seeds that assign each tea its own image using a URL.

For a good show of the evolution of this back end i recommend looking at m migrations as it shows how my plans changed through out the project