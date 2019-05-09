Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/clear', to: 'purchases#clear_cart', as: 'clear'

  resources :suppliers
  resources :inventories
  resources :purchases, except: [:update]
  resources :customers
  get '/customers/new', to: 'customers#show'

  get '/checkout', to: 'purchases#checkout', as: 'checkout'
  patch '/checkout/:id', to: 'purchases#update'
  delete "/checkout/:id", to: 'purchases#destroy'

  get '/order', to: 'purchases#place_order', as: 'place_order'
  patch '/order/:id', to: 'purchases#update_cart'

  delete "/logout", to: "sessions#destroy", as: "logout"
  post '/inventories/:id', to: 'purchases#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
