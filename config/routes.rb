Rails.application.routes.draw do
 
  get 'reviews/new'

  get 'reviews/create'

  get 'sessions/new'

  get 'sessions/create'

  # get 'users/new'

  # get 'users/create'

  get 'search', to: 'movies#search'
  
  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do
    resources :users do
      post 'impersonate', on: :member
      post 'end_impersonating', on: :member
    end
  end

  resources :users, except: [:delete] 

  resource :session, only: [:new, :create, :destroy]

  root to: 'movies#index'

end
