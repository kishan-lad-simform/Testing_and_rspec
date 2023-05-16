Rails.application.routes.draw do

  devise_for :users
  resources :test_products 
  get '/all_products', to: 'test_products#all_products'
  root 'test_products#index'
end
