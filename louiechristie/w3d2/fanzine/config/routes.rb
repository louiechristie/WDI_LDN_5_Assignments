Fanzine::Application.routes.draw do
  
  get '/index' => 'home#index'

  get '/bio' => 'home#bio'
  get '/photos' => 'home#photos'
  get '/music' => 'home#music'
  get '/video' => 'home#video'
  get '/contact' => 'home#contact'
  
  root :to => 'home#start'

end
