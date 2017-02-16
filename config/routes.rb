Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:    "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations",
  }

  resources :goals do
    post :done, action: :done
    post :cancel, action: :cancel
  end

  resources :daily_reports

  resources :dashboards, path: :dashboard, only: [:index]

  root to: "dashboards#index"
end
