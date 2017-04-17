Rails.application.routes.draw do
  resources :stores, :except => [:index]
  resources :products
  get 'pages/index'

  get 'pages/sell'

  get 'pages/about'

  # get 'stores/dashboard'
  devise_for :users
  resources :users, :only => [:show]
  root "pages#index"
end
