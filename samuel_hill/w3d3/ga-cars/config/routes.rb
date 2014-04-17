GaCars::Application.routes.draw do
  
  resources :cars

  # get '/cars/new' => 'cars#new'

  # post '/cars/:id/edit' => 'cars#edit'

  # post '/cars/:id' => 'cars#show'

  root to: 'cars#index'


end
