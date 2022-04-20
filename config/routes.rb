Rails.application.routes.draw do

  get '/', to: 'welcome#index'

  get '/auth/google_oauth2/callback', to: 'users#create'

  get '/dashboard', to: 'users#dashboard'

  post '/search', to: 'topics#search'

end
