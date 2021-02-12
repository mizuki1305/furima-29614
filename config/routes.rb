Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  resources :listings, only: [:index, :new, :create] do
    # resources :purchase, only: [:index, :create]
  end
end