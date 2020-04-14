Rails.application.routes.draw do
  devise_for :users
  root "blogs#index"
  resources :users, only: [:index, :show, :edit, :update]
  resources :blogs, only: [:index, :new, :create]
end