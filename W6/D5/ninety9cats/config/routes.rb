Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats
  # delete 'cats/:id', to: 'cats#destroy', as: 'delete_cat'
end
