MoviesHomeworkRails::Application.routes.draw do
 
 resources :formats
 resources :movies
 resources :users, only: [:index, :new, :create]
 resources :sessions

 root to: 'home#index'
end
