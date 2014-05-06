MtaApp::Application.routes.draw do
 
get '/mta' => 'home#mta'

root :to => 'home#mta'


end
