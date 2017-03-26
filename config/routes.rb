Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:    "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations",
  }

  resources :goals do
    post :done, action: :done
    post :cancel, action: :cancel

    resources :daily_reports, only: :create
  end

  resources :payments, only: [:create] do
    post :notification, action: :notification, on: :collection
  end

  resources :dashboards, path: :dashboard, only: [:index]

  root to: "dashboards#index"
end
