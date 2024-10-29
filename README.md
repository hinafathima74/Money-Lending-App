Money Lending Application
## Features

- **User Authentication**: Secure login and registration using the [Devise gem](https://github.com/heartcombo/devise).
- **Wallet Management**: Each user starts with a wallet balance of 10,000 rupees, while the admin starts with 1,000,000 rupees.
- **Loan Management**: Users can request loans, which can be approved or rejected by the admin. The application tracks multiple loan states.
- **Flexible Loan States**: Loans can be in various states: "requested", "approved", "open", "closed", "rejected", "waiting_for_adjustment_acceptance", and "readjustment_requested".
- **Interest Calculation**: Interest on open loans is calculated every 5 minutes using background processing (via Sidekiq or Resque).
- **Transaction Management**: Users can repay loans, and the application handles wallet transactions between users and the admin.
## Ruby Version

Make sure you have Ruby version **3.1.0** or higher installed.

## System Dependencies

Ensure that the following software is installed on your machine:

- Ruby (3.1.0 or higher)
- Rails (6.1.4 or higher)
- MySQL (8.0 or higher)
- Bundler
- Sidekiq** (or Resque): Background job processing

# Database Creation
rails db:create
rails db:migrate
rails db:seed
