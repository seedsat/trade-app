Rails.application.routes.draw do
  root 'pictures#index'
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  resources :pictures do
    resources :tradings, only: :create
    resources :comments, only: :create
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show] do
    resources :addresses, only: [:new, :create, :edit, :update]
    member do
      get 'like'
    end
  end
  post 'picture/:picture_id/tradings/:user_id' => 'tradings#create', as: 'create_trading'
  # post 'like/:id' => 'likes#create', as: 'create_like'
  # delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
