Rails.application.routes.draw do
  resource :sessions,
           only: [:new, :create, :destroy]
  resources :users
  root 'index#index'
end
