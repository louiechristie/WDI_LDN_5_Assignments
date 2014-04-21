Links::Application.routes.draw do
  
  post '/journey' => 'home#journey'
  post '/station' => 'home#station'
  root :to => 'home#start'

end
