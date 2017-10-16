Rails.application.routes.draw do
  root 'welcome#index'
 
  get 'welcome/index'
  
  get 'signup', to: 'users#new'
  
  resources :clients
  resources :services
  resources :service_listings

  resources :teens
  resources :users
end
