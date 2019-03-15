Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  get 'items/confirm_buy', to: 'items#confirm_buy'
  get 'items/show', to: 'items#show'
  get 'items/detail', to: 'items#detail'
  resources :items
  resources :signup, only: [:index]

  resources :items, except: :show


  resources :users, only: [:show, :edit]

end
