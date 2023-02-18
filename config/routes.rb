Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :requests, except: [:destroy, :index]

  resources :items, except: [:destroy, :show]
  get '/requests/:id/confirmation', to: 'requests#confirmation'

  get '/dashboard', to: 'pages#dashboard'

  post '/requests/:request_id/items', to: 'items#create_nested_item', as: :create_nested_item
  patch '/requests/:request_id/items', to: 'items#update_nested_item', as: :update_nested_item

  get '/requests/:id/pickuptype', to: "requests#edit_pickup", as: :edit_pickup
  patch '/requests/:id/pickuptype/ressourcerie', to: "requests#update_pickup_ressourcerie", as: :update_pickup_ressourcerie
  patch '/requests/:id/pickuptype/maraude', to: "requests#update_pickup_maraude", as: :update_pickup_maraude

  patch '/requests/:id/delivered', to: 'requests#update_delivered', as: :update_delivered

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
