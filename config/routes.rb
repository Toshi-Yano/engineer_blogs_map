Rails.application.routes.draw do
  devise_for :users
  root "blogs#index"
  resources :blogs
  resources :users, only: [:index, :show, :edit, :update]
  resources :like_blogs, only: [:create, :destroy]
end