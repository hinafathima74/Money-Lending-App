Rails.application.routes.draw do
  get "dashboard/admin"
  get "dashboard/user"
  get "home/index"
  root to: 'home#index'
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # Define separate dashboards for admin and users
  get 'admin_dashboard', to: 'dashboard#admin', as: :admin_dashboard
  get 'user_dashboard', to: 'dashboard#user', as: :user_dashboard


  resources :loans # Loan routes

  # Custom routes for admin actions on loans
  namespace :admin do
    resources :loans, only: [:index, :approve, :reject, :adjust]
  end
end
