# frozen_string_literal: true

Rails.application.routes.draw do
  resources :subscriptions
  root to: 'application#index'

  resources :categories, only: %i[index new create]
  get '/categories/:name', to: 'posts#index', as: 'category'

  resources :comments, only: %i[create update destroy]
  resources :posts do
    resources :comments, only: [:edit]
  end
  resources :users

  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Colloborator
  resources :collaborators, only: [:destroy]
  post '/collaborator', to: 'collaborators#create'

  get '/analytics', to: 'analytics#home', as: 'analytics'
  # delete '/collaborator/:id', to: 'collaborators#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
