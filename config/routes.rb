Rails.application.routes.draw do
  root 'top#index'

  get 'relationships/create'
  get 'relationships/destroy'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :followings
      get :followers
    end
    collection do
      get :search
    end
  end

  resources :products do
     collection do
      get :search
    end
  end

  resources :comments, only: [:index, :show, :new, :create, :destroy] do
    collection do
      get :search
    end
  end

  resources :relationships, only: [:create, :destroy]

end
