CookbookOnRails::Application.routes.draw do
  
  resources :categories

  resources :ingredients

  resources :recipes

  resources :users, only: [:index, :new, :create]

  resources :sessions

  root :to => 'recipes#index'
end
