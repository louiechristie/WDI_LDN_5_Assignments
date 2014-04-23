Fanzine::Application.routes.draw do
  
  get '/index' => 'home#index'

  post '/index' => 'home#index'

  root :to => 'home#index'

end
