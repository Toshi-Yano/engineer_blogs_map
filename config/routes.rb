Rails.application.routes.draw do
  devise_for :users
  root "blogs#index"
  namespace :blogs do
    resources :searches, only: :index
  end
  resources :blogs do
    collection do
      get :searchpage
    end
  end
  resources :blogs do
    resources :reviews, only: [:create, :destroy]
  end
  # resources :blog
  resources :users, only: [:index, :show, :edit, :update]
  resources :like_blogs, only: [:create, :destroy]
end