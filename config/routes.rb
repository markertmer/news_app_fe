# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/dashboard', to: 'users#show'
  get '/register', to: 'users#new'

  get '/auth/google_oauth2/callback', to: 'users#create'
  get '/auth/failure', to: 'welcome#error'
end
