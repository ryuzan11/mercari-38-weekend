Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items
  resources :signup, only: [:index]
  get 'items/show', to: 'items#show'
  get 'items/detail', to: 'items#detail'
  get 'creditcards/new', to: 'creditcards#new'
  resources :items, except: :show
<<<<<<< HEAD
  resources :users, only: [:show]
  resources :creditcard, only: [:new]
=======
  resources :users, only: [:show, :edit]
>>>>>>> keishi-masui/master

end
