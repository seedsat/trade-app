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
  end
  resources :users, only: [:show] do
    resources :addresses, only: [:new, :create, :edit, :update]
  end
end
