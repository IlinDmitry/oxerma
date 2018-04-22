Rails.application.routes.draw do
  resources :tickets
  resources :organizations
  resource :sessions,
           only: [:new, :create, :destroy]
  resources :users do
    get 'settings', to: 'users#settings', on: :member
  end
  root 'index#index'
end
