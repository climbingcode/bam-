Rails.application.routes.draw do



  root to: 'users#index'



  resources :users do

    resources :brands do

      resources :logos 

      resources :colors

      resources :fonts 

      resources :copies

      resources :guidelines 

      resources :misc_assets 

    end

  end

  namespace :admin do 
    resources :users 
  end

  resource :sessions, only: [:new, :create, :destroy]

  resources :contact_form, only: [:new, :create]

  resources :permissions, only: [:show, :update, :edit]  

  resource :brand, only: [:show]

  get '/:id', to: 'brand#show'


end
