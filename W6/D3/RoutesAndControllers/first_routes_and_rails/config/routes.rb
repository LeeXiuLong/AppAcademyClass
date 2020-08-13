Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/users', to: 'users#index'
  # post '/users/:id', to: 'users#create'
  # post '/users', to:'users#create'
  # get '/users/:id', to: 'users#show', as: "user"
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  
  resources :users do
    resources :artworks, only: :index
  end

  resources :users do
    resources :comments, only: :index
  end

  resources :artworks do
    resources :comments, only: :index
  end

  resources :users do
    resources :artworks do
      resources :likes, only: :create
    end
  end

  resources :users do
    resources :likeable do
      resources :likes, only: :create
    end
  end

  resources :users do
    resources :artworks do
      resources :likes, only: :destroy
    end
  end

  resources :users do
    resources :comments do
      resources :likes, only: :destroy
    end
  end

  resources :users do
    resources :likes, only: :index
  end

  resources :artworks do
    resources :likes, only: :index
  end

  resources :comments do
    resources :likes, only: :index
  end

  resources :users, only: [:create, :destroy, :index, :show, :update]
  resources :artworks, only: [:create, :destroy, :show, :update]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy, :index]

end
