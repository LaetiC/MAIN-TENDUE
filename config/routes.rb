Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :requests, except: [:destroy]
  resources :item, except: [:destroy, :show]
  get '/requests/:id/confirmation', to: 'requests#confirmation'

  get '/dashboard', to: 'pages#dashboard'

  #à rajouter les routes pour la messagerie
end
