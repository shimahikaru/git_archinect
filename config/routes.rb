Rails.application.routes.draw do

  devise_for :users
  root 'top#index'

  resources :users, only: [:show, :edit, :update]

  resources :products do
     collection do
      get :search
    end
  end

end
