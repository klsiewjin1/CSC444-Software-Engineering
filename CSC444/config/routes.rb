Rails.application.routes.draw do
  
  resources :clients
  resources :services
  resources :service_listings

  resources :teens
  resources :users
  get 'welcome/index'
  root 'welcome#index'
end
