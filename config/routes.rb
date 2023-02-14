Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :requests, except: [:destroy, :index]

  resources :items, except: [:destroy, :show]
  get '/requests/:id/confirmation', to: 'requests#confirmation'

  get '/dashboard', to: 'pages#dashboard'

  post '/requests/:request_id/items', to: 'items#create_nested_item', as: :create_nested_item

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
