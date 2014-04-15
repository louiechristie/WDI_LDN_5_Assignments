Railsfanzine::Application.routes.draw do
  
  get '/band' => 'home#band'
  get '/scary' => 'home#scary'
  get '/sporty' => 'home#sporty'
  get '/posh' => 'home#posh'
  get '/ginger' => 'home#ginger'
  get '/baby' => 'home#baby'
  
  root :to => 'home#start'


end
