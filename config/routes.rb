Rails.application.routes.draw do
  root "items#index"
  resources :items
  resources :users, only: [:show]
end
