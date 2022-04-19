Rails.application.routes.draw do

  # root 'welcome#index'
  get '/', to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'users#create'

  get '/dashboard', to: 'users#dashboard'

  post '/search', to: 'topics#search'

  

  # get '/topics/:topic', to: 'topics#show'


end
