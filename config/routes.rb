Rails.application.routes.draw do
  resources :organizations
  resource :sessions,
           only: [:new, :create, :destroy]
  resources :users
  root 'index#index'
end
