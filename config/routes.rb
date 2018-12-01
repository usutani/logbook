Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end

  root to: "restaurants#index"
  resources :restaurants
end
