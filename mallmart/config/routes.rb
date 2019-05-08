Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/clear', to: 'purchases#clear_cart', as: 'clear'

  resources :suppliers
  resources :inventories
  resources :purchases
  resources :customers
  get '/customers/new', to: 'customers#show'
  patch '/purchases/:id', to: 'purchases#update'
  get '/checkout', to: 'purchases#checkout', as: 'checkout'
  delete "/logout", to: "sessions#destroy", as: "logout"
  post '/inventories/:id', to: 'purchases#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
