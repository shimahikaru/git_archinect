Rails.application.routes.draw do
  root 'top#index'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
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
