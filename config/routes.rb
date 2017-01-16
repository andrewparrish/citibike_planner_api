require 'resque/server'

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources 'station', only: [:show] do
    put 'favorite', to: 'station#favorite'
    get 'streetview/:width', to: 'station#street_view'
  end

  get 'stations', to: 'station#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
