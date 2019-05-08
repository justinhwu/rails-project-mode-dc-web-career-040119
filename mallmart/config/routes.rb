Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete "/logout", to: "sessions#destroy", as: "logout"
  resources :suppliers
  resources :inventories
  resources :purchases
  resources :customers
  get '/customers/new', to: 'customers#show'
  post '/inventories/:id', to: 'purchases#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
