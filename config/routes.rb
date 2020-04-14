Rails.application.routes.draw do
  devise_for :users
  root "blogs#index"
  resources :users, onlu: [:index, :new]
  resources :blogs, only: :index
end
