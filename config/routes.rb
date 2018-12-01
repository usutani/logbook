Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get 'sessions/new'
  namespace :admin do
    resources :users
  end

  root to: "restaurants#index"
  resources :restaurants
end
