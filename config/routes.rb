require 'resque/server'

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  get 'station/index'

  get 'station/show'

  get 'stations', to: 'station#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
