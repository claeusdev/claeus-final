Rails.application.routes.draw do

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

  resource :relationships, only: [:create, :destroy]

  get 'index', :to => 'pages#index'

  get 'sell', :to => 'pages#sell'

  get 'about', :to => 'pages#about'

  get 'contact', :to => 'pages#contact'

  get 'blog', :to => 'pages#blog'

  get 'support', :to => 'pages#support'

  get 'terms', :to => 'pages#terms'

  get 'privacy', :to => 'pages#privacy'

  get 'advertise', :to => 'pages#advertise'

  resources :categories, :only => [:index, :show]
  resources :subcategories, :only => [:index, :show]


  # get 'stores/dashboard'
  devise_for :users, :controllers => {:registrations => "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks"}

  # devise_scope :user do
  #   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  resources :users, :only => [:show]
  root "pages#index"
end
