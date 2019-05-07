Rails.application.routes.draw do
  resources :suppliers
  resources :inventories
  resources :purchases
  resources :customers

  post '/purchases', to: 'inventories#add'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
