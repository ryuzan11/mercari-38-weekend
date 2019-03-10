Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items
  resources :signup, only: [:index]
  get 'items/show', to: 'items#show'
  get 'items/detail', to: 'items#detail'
  get 'creditcards/new', to: 'creditcards#new'
  resources :items, except: :show
  resources :users, only: [:show, :edit]
  resources :creditcard, only: [:new]
end
