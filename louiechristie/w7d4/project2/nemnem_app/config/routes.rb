Contacts::Application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: 'omniauth_callbacks'}

  resources :contacts

  root to: 'contacts#index'
end
