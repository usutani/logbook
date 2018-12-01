Rails.application.routes.draw do
  get 'sessions/new'
  namespace :admin do
    resources :users
  end

  root to: "restaurants#index"
  resources :restaurants
end
