Rails.application.routes.draw do
  root "items#index"
  get 'items/show', to: 'items#show'
  get 'items/detail', to: 'items#detail'
  resources :items, except: :show
end
