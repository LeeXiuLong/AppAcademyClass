# == Route Map
#
#          Prefix Verb URI Pattern                           Controller#Action
# api_guest_gifts GET  /api/guests/:guest_id/gifts(.:format) api/gifts#index {:format=>:json}
#      api_guests GET  /api/guests(.:format)                 api/guests#index {:format=>:json}
#       api_guest GET  /api/guests/:id(.:format)             api/guests#show {:format=>:json}

Rails.application.routes.draw do
  # Your routes here!

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    resources :guests, only: [:index, :show] do
      resources :gifts, only: [:index]
    end
    
    resources :gifts, only: [:show]

    resources :parties, only: [:index, :show]
  end





  
end
