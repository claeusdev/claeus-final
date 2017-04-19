Rails.application.routes.draw do
  resources :stores, :except => [:index] do
    collection do
      get 'dashboard'
    end
  end
  resources :products do
    collection do
      get 'search'
    end
  end
  get 'pages/index'

  get 'pages/sell'

  get 'pages/about'

  # get 'stores/dashboard'
  devise_for :users
  resources :users, :only => [:show]
  root "pages#index"
end
