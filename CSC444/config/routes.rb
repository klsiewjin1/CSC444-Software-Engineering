Rails.application.routes.draw do
  resources :orders
  root 'welcome#index'
  get 'welcome/index'
  get '/contact', to: 'welcome#contact'
  
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
  patch '/approval', to: 'service_listing_approvals#update'
  delete '/approval', to: 'service_listing_approvals#destroy'
  # patch '/approval', to: 'users#show'

  get '/nearme', to: 'service_listings#nearme'
  get '/map', to: 'service_listings#mapView'
  get '/service_listings', to: 'service_listings#mapView'
  
  resources :users do
    collection do 
      get :listing
    end
  end
  
  resources :notifications do
    collection do
      get :link_to_profile
      get :link_to_my_listings
    end
  end
  
  resources :services
  resources :service_listings
  resources :users
  resources :reviews
  
  resources :account_activations, only: [:edit]
end
