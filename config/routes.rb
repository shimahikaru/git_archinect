Rails.application.routes.draw do

  root 'top#index'
  get 'top/about', to: 'top#about'
  get 'top/search', to: 'top#search'

  get 'relationships/create'
  get 'relationships/destroy'
  resources :relationships, only: [:create, :destroy]


  get 'inquiries', to: 'inquiries#index'
  post 'inquiries/confirm', to: 'inquiries#confirm'
  post 'inquiries/complete', to: 'inquiries#complete'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
  get 'emails', to: 'emails#index'
  post 'emails/confirm', to: 'emails#confirm'
  post 'emails/complete', to: 'emails#complete'
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

end
