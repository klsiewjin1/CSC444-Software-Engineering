Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'
  
  # Signup page
  get 'signup', to: 'users#new'
  
  # Add a listing
  get 'addListing', to: 'service_listings#new'
  
  # Logins and sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # Approval create page not accessible for user, this route is needed for the approval button in service listings
  post '/approval', to: 'service_listing_approvals#create'
  
  resources :services
  resources :service_listings
  resources :users
  resources :reviews
end
