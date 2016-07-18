Rails.application.routes.draw do
  #devise_for :restaurants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :owner do
  get 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  root to: 'restaurants#index'

  resources :restaurants
  resources :reservations, :only => [:show, :new, :create, :destroy, :index], :controller => 'reservations'
  
  devise_for :owners 

  resources :restaurants, :except => [:new, :create] do
    resources :reservations, :only => [:new, :create]
  end

  resources :owners do
    resources :restaurants, :only => [:new, :create]
  end
end
