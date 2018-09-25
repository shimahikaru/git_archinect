Rails.application.routes.draw do

  devise_for :users
  root 'top#index'

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

end
