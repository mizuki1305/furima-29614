Rails.application.routes.draw do
  devise_for :users
  get 'items', to: 'items#index'
  resources :items, only: :index
  root 'items#index'
end
   