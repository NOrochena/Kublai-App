# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tags
  resources :comments
  resources :posts do
    resources :comments, only: [:edit]
  end
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
