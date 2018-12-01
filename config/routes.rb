Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/new'
    get 'users/edit'
  end
  root to: "restaurants#index"
  resources :restaurants
end
