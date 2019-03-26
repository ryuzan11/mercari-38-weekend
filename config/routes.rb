Rails.application.routes.draw do
  devise_for :users

  # item関連
  root "items#index"

  get 'items/confirm_buy', to: 'items#confirm_buy'
  get 'items/show', to: 'items#show'
  get 'items/detail', to: 'items#detail'
  resources :items
  resources :signup, only: [:index]

  resources :items, except: :show
  
  
  get 'creditcards/new', to: 'creditcards#new'
  resources :items, except: :show

  # user関連
  get 'users/register', to: 'users#register'
  get 'users/profile', to: 'users#profile'
  get 'users/logout', to: 'users#logout'
  resources :users, only: [:show, :edit]

  resources :creditcard, only: [:new]

  resources :signup_info
end
