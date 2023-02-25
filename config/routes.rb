Rails.application.routes.draw do
  resources :apartments
  resources :flats
  devise_for :users
  root to: "pages#home"

  resources :requests, except: [:destroy, :index]

  resources :items, except: [:destroy, :show]
  get '/requests/:id/confirmation', to: 'requests#confirmation', as: :request_confirmation

  get '/dashboard', to: 'pages#dashboard'

  post '/requests/:request_id/items', to: 'items#create_nested_item', as: :create_nested_item
  patch '/requests/:request_id/items', to: 'items#update_nested_item', as: :update_nested_item

  get '/requests/:id/pickuptype', to: "requests#edit_pickup", as: :edit_pickup

  patch '/requests/:id/delivered', to: 'requests#update_delivered', as: :update_delivered

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
