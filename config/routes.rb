Rails.application.routes.draw do
  root 'pictures#index'
  devise_for :users
end
