FanzineLab::Application.routes.draw do

get '/band' => 'home#band'
get '/bio' => 'home#bio'
get '/videos' => 'home#videos'
get '/tour' => 'home#tour'
get '/home' => 'home#index'
root :to => 'home#index'

end
