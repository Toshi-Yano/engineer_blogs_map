Rails.application.routes.draw do
  devise_for :users
  root "blogs#index"
  namespace :blogs do
    resources :myblogs, only: [:index, :new, :create, :destroy]
    resources :footer, only:[:index] do
      collection do
        get :policy_index, :contact_form
      end
    end
  end
  resources :blogs do
    resources :reviews, only: [:create, :edit, :update, :destroy]
    collection do
      get :search_show
    end
  end
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :like_blogs, only: [:create, :destroy]
  resources :tags, only: [:index]
end