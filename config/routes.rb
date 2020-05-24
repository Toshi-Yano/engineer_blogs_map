Rails.application.routes.draw do
  devise_for :users
  root "blogs#index"
  resources :blogs do
    resources :reviews, only: [:create, :edit, :update, :destroy]
    collection do
      get :search_show
      get :new_myblog
      get :create_myblog
      get :search_myblog
    end
    member do
      delete :delete_myblog
    end
  end
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :like_blogs, only: [:create, :destroy]
  resources :tags, only: [:index]
end