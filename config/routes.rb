Rails.application.routes.draw do
  root 'pictures#index'
  devise_for :users
  resources :pictures
  resources :users, only: [:show]
end
