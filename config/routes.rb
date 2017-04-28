Rails.application.routes.draw do
  resources :categories, :only => [:index, :show, :new]

  resources :stores, :except => [:index] do
    collection do
      get 'dashboard'
    end
  end
  
  resources :products do
    resources :reviews, except: [:index, :show]
    
    collection do
      get 'search'
    end
  end

  get 'pages/index'

  get 'pages/sell'

  get 'pages/about'

  # get 'stores/dashboard'
  devise_for :users, :controllers => {:registrations => "user/registrations"}
  resources :users, :only => [:show]
  root "pages#index"
end
