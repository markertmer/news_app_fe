Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/dashboard', to: 'users#show'

  get '/auth/google_oauth2/callback', to: 'users#create'
end
