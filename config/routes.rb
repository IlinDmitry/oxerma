Rails.application.routes.draw do
  resources :users
  root 'index#index'
end
