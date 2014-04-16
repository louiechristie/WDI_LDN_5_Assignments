MtaApp::Application.routes.draw do
  
  get '/home' => 'home#home'
  post '/home' => 'home#home'
  root :to => 'home#home'

end
