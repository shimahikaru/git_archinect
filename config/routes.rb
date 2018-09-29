Rails.application.routes.draw do
  root 'top#index'

#   devise_for :viewers, controllers: {
#   sessions:      'viewers/sessions',
#   passwords:     'viewers/passwords',
#   registrations: 'viewers/registrations'
# }

#   resources :viewers, only: [:index, :show, :edit, :update] do
#     collection do
#       get :search
#     end
#   end

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

end
