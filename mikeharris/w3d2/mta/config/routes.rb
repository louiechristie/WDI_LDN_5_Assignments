Mta::Application.routes.draw do
  


post '/result' => 'home#result'  

root :to => 'home#home'
end
