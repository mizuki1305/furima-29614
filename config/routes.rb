Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
<<<<<<< Updated upstream
  resources :listings, only: [:index, :new, :create, :show] do
=======
  resources :listings, only: [:index, :new, :create :edit] do
>>>>>>> Stashed changes
  end
end