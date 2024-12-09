# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'home', to: 'pages#home', as: 'home'

  get 'marketplace', to: 'parts#index', as: :marketplace
  post 'marketplace', to: 'parts#create', as: 'parts'
  get 'marketplace/new', to: 'parts#new', as: 'new_part'
  get 'marketplace/:id', to: 'parts#show', as: 'part'
  get 'marketplace/:id/edit', to: 'parts#edit', as: 'edit_part'
  patch 'marketplace/:id', to: 'parts#update'
  delete 'marketplace/:id', to: 'parts#destroy'

  post 'build_items', to: 'build_items#create'

  # user profile page
  # get 'users/:id' => 'users#show'
  resources :users, only: [:show]

  resources :orders do
    resources :order_items, only: %i[create update destroy]
    resource :payment, only: %i[new create show update destroy] do
      get 'edit', on: :collection
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :builds do
    resources :build_items
    resources :parts
  end
  resources :messages, only: %i[create index new show]
  # get 'builds/:build_id/build_items', to: 'build_items#index', as: 'build_build_items'
  # post 'builds/:build_id/build_items', to: 'build_items#create'

  # get 'builds/:build_id/build_items/new', to: 'build_items#new', as: 'new_build_build_item'
  # get 'builds/:build_id/build_items/:id', to: 'build_items#show', as: 'build_build_item'

  # Defines the root path route ("/")
  root 'pages#home'
end
