Rails.application.routes.draw do
  get 'items', to: 'items#index'
  resources :items, only: :index
  root 'items#index'
end
   