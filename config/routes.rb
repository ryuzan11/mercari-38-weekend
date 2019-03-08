Rails.application.routes.draw do
  devise_for :users
  root "items#index"
<<<<<<< HEAD
  resources :items
  resources :signup, only: [:index]
=======
  get 'items/show', to: 'items#show'
  get 'items/detail', to: 'items#detail'
  resources :items, except: :show
  resources :users, only: [:show]

>>>>>>> keishi-masui/master
end
