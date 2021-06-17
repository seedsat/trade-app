Rails.application.routes.draw do
  root 'pictures#index'
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  resources :pictures do
    resources :comments, only: :create
    collection do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show] do
    resources :addresses, only: [:new, :create, :edit, :update]
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
