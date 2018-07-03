Rails.application.routes.draw do
  get 'adds/create'
  root 'users#index'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: 'user'
  get '/songs' => 'songs#index', as: 'dashboard'
  get '/songs/:id' => 'songs#show', as: 'song'
  get '/songs/add/:id' => 'adds#create'
  post '/songs/new' => 'songs#create'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'


end
