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

  resource :sessions, only: [:new, :create, :destroy]

  resources :contact_form, only: [:new, :create] 

  resource :brand, only: [:show]

  namespace 'permission' do 
    resources :users 
  end

  get '/:id', to: 'brand#show'


end
