Rails.application.routes.draw do

  resources :clients
  resources :teens
  resources :users
  get 'welcome/index'
  root 'welcome#index'
end
