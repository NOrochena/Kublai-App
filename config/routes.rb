# frozen_string_literal: true

Rails.application.routes.draw do
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
  post '/collaborator', to: 'collaborators#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
