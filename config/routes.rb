Rails.application.routes.draw do

  get 'sessions/create'
  get 'sessions/destroy'

  devise_for :users
  root 'store#index', as: 'store'

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :users
  resources :carts, only: [:show]
  resources :line_items, only: [:create]
  resources :orders, only: [:show]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

  get '/users/signout', to: 'devise/sessions#destroy'
  delete '/users/sign_out', to: 'devise/sessions#destroy'

end


