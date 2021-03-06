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

      resources :pdfs 
    end
  end

  resources :brandpages, only: [:show]

  resource :sessions, only: [:new, :create, :destroy]

  resources :contact_form, only: [:new, :create] 

  resources :logos do
    collection do
      get :download
    end
  end

  
  # scope 'pdfs/:id' do
  #   get 'business_card', to: 'pdfs#business_card'
  #   get 'letter_head', to: 'pdfs#letter_head'
  # end

  namespace 'permission' do 
    resources :users 
  end

  match '/add_brand', to: 'users#add_brand', via: 'post'

  match '/search_brand', to: 'brands#search_brand', via: 'post'

  match '/search_results', to: 'brands#search_results', via: 'get'

  match '/sign_up_at_search', to: 'users#sign_up_at_search', via: 'post'

  match '/sign_in_at_search', to: 'sessions#sign_in_at_search', via: 'post'

  match "/:slug", to: "brandpages#show", via: 'get'

  match 'users/:user_id/brands/:brands_id/change_privacy', to: 'brands#change_privacy', via: 'post'


end
