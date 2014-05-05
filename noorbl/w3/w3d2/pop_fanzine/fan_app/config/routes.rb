FanApp::Application.routes.draw do
 
 get '/band' => 'home#band'
 get '/history' => 'home#history'
 get '/george' => 'home#george'
 get '/andrew' => 'home#andrew'
 get '/music' => 'home#music'
 get '/gallery' => 'home#gallery'



 root :to => 'home#band'
end
