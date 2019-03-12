Rails.application.routes.draw do
  devise_for :users

  # item関連
  root "items#index"
  resources :items
  resources :signup, only: [:index]
  get 'items/show', to: 'items#show'
  get 'items/detail', to: 'items#detail'
  resources :items, except: :show

  # user関連
  get 'users/register', to: 'users#register'
  resources :users, only: [:show, :edit]



end
