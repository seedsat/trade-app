Rails.application.routes.draw do
  root 'pictures#index'
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  resources :pictures
  resources :users, only: [:show]
end
