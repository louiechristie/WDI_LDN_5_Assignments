GaCars::Application.routes.draw do
  
  resources :cars

  resources :engines
 
  root to: 'cars#index'


end
