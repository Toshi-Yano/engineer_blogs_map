Rails.application.routes.draw do
  devise_for :users
  root "blogs#index"
  resources :users, onlu: [:index, :show, :edit]
  resources :blogs, only: [:index, :new, :create]
end