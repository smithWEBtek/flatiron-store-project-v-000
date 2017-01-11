Rails.application.routes.draw do

  get '/admin', to: 'application#admin'
  root 'store#index', as: 'store'
  get '/users/sign_out', to: 'store#index'
 
  post 'carts/:id', to: 'carts#checkout', as: '/checkout'

  devise_for :users

  resources :items, only: [:show]
  resources :categories, only: [:show, :index]
  resources :carts, only: [:show, :create]
  resources :line_items, only: [:create]
  resources :orders, only: [:show]

end
 