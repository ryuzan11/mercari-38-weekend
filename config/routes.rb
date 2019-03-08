Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  get 'items/show', to: 'items#show'
  get 'items/detail', to: 'items#detail'
  resources :items, except: :show
  resources :users, only: [:show]
end
