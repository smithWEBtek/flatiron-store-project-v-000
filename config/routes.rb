Rails.application.routes.draw do
  get '/users/sign_out', to: 'store#index'

  devise_for :users
  root 'store#index', as: 'store'

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :carts, only: [:show, :create, :index]
  resources :line_items, only: [:create]
  resources :orders, only: [:show]

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

  get '/users', to: 'store#users', as: 'store/users'

end
 