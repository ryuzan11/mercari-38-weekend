Rails.application.routes.draw do
  root "items#index"
  get 'items/show', to: 'items#show'
  get 'items/detail', to: 'items#detail'
  get 'creditcards/new', to: 'creditcards#new'
  resources :items, except: :show
  resources :users, only: [:show]
  resources :creditcard, only: [:new]

end
