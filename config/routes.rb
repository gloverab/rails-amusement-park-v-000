Rails.application.routes.draw do
  root to: 'users#index'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/rides/new', to: 'rides#new'

  resources :users
  post 'users/new', to: 'users#create'

  resources :attractions
  post 'attractions/new', to: 'attractions#create'
  post 'attractions/:id/edit', to:'attractions#update'


end
