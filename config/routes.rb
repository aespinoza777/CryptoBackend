Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :exchanges, only: [:index]
resources :coins, only: [:index]
resources :sessions, only: [:create]
resources :users, only: [:create]
resources :accounts, only: [:index, :create, :update]
get "/current_user", to: "current_user#index"
end
