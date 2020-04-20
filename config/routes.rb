Rails.application.routes.draw do
  devise_for :users
  root "blogs#index"
  resources :blogs do
    resources :reviews, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  resources :like_blogs, only: [:create, :destroy]
end