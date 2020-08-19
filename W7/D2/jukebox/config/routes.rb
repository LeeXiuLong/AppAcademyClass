Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only:[:new, :create, :show]

  resource :session, only:[:new, :create, :destroy]

  resources :artists
  
  resources :albums, only: [:create, :edit, :show, :update, :destroy]

  resources :artists do
    resources :albums, only: :new
  end
end
