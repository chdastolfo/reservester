Rails.application.routes.draw do
  #devise_for :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "users/dashboard"
  
  devise_scope :user do
  get 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  root to: 'restaurants#index'

  resources :restaurants
  resources :reservations, :only => [:show, :new, :create, :destroy, :index], :controller => 'reservations'
  
  devise_for :users 

  resources :restaurants, :except => [:new, :create] do
    resources :reservations, :only => [:create]
  end

  resources :users do
    resources :restaurants, :only => [:new, :create]
  end

  resources :restaurants do
    resource :favorites, only: [:create, :destroy]
  end
end

