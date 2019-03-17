Rails.application.routes.draw do
  devise_for :users

  # item関連
  root "items#index"
<<<<<<< HEAD
=======
  resources :items
  resources :signup, only: [:index]
>>>>>>> master
  get 'items/show', to: 'items#show'
  get 'items/detail', to: 'items#detail'
  get 'creditcards/new', to: 'creditcards#new'
  resources :items, except: :show
<<<<<<< HEAD
  resources :users, only: [:show]
=======

  # user関連
  get 'users/register', to: 'users#register'
  get 'users/profile', to: 'users#profile'
  get 'users/logout', to: 'users#logout'
  resources :users, only: [:show, :edit]

  resources :creditcard, only: [:new]

>>>>>>> master
end
