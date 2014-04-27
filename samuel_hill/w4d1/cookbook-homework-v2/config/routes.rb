CookbookHomework::Application.routes.draw do

  resources :categories

  resources :recipes

  resources :ingredients

  resources :users, only: [:index, :new, :create]

  resources :sessions

  root to: 'home#index'

end
