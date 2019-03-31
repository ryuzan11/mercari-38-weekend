Rails.application.routes.draw do
  devise_for :users

  # item関連
  root "items#index"

  get 'items/:id/confirm_buy', to: 'items#confirm_buy'
  post 'items/pay',to: 'items#pay'
  get 'items/detail', to: 'items#detail'

  resources :items
  resources :signup, only: [:index]



  get 'creditcards/new', to: 'creditcards#new'


  # user関連
  get 'users/register', to: 'users#register'
  get 'users/profile', to: 'users#profile'
  get 'users/logout', to: 'users#logout'
  resources :users, only: [:show, :edit]

  resources :creditcard, only: [:new]

  resources :signup_info
end
