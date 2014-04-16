Fanzine::Application.routes.draw do
  
  get '/' => 'home#got'
  get '/joffrey' => 'home#joffrey'
  get '/robb' => 'home#robb'
  get '/ned' => 'home#ned'
end
