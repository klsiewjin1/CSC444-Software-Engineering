Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'
  
  # Signup page
  get 'signup', to: 'users#new'
  
  # Logins and sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :services
  resources :service_listings
  resources :teens
  resources :clients
  resources :users
end
