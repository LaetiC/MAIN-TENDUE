Rails.application.routes.draw do
  get 'items/new'
  get 'items/create'
  get 'items/update'
  get 'items/edit'
  get 'items/destroy'
  get 'items/index'
  get 'items/show'
  get 'requests/new'
  get 'requests/create'
  get 'requests/update'
  get 'requests/edit'
  get 'requests/destroy'
  get 'requests/index'
  get 'requests/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
