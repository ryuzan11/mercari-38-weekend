Rails.application.routes.draw do
  devise_for :users

  # item関連
  root "items#index"
  resources :items
  resources :signup, only: [:index]

  get 'items/confirm_buy', to: 'items#confirm_buy'
  get 'items/detail', to: 'items#detail'
  get 'creditcards/new', to: 'creditcards#new'


  # user関連
  get 'users/register', to: 'users#register'
  get 'users/profile', to: 'users#profile'
  get 'users/logout', to: 'users#logout'
  resources :users, only: [:show, :edit]

  resources :creditcard, only: [:new]

  resources :signup_info
end
