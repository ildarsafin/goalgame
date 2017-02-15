Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:    "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations",
  }

  resources :goals
  resources :daily_achievements

  resources :dashboards, path: :dashboard, only: [:index]

  root to: "dashboards#index"
end
