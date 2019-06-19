# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories, except: :show
  get '/categories/:name', to: 'posts#index'

  resources :tags
  resources :comments
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
  # delete '/collaborator/:id', to: 'collaborators#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
