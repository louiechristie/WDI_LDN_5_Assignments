Fanzine::Application.routes.draw do

get '/index' => 'home#index'
  get '/bio' => 'home#bio'
  get '/music' => 'home#music'
  get '/video' => 'home#video'
  get '/review' => 'home#review'
  root :to => 'home#index'

end
