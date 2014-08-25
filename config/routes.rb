Rails.application.routes.draw do



  get 'brand/show'

  get 'brand/index'

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

  resource :brand, only: [:show, :index]

  namespace 'permission' do 
    resources :users 
  end

  match '/add_brand', to: 'users#add_brand', via: 'post'

  get '/:id', to: 'brand#show'


end
