Rails.application.routes.draw do

  resources :accounts
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  resources :suppliers
  resources :inventories
  resources :purchases
  resources :customers

  post '/inventories/:id', to: 'purchases#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
