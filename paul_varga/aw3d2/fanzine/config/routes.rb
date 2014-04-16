Fanzine::Application.routes.draw do

  
  get '/pinkfloyd' => 'pinkfloyd#pinkfloyd'
  get '/roger' => 'pinkfloyd#roger'
  get '/david' => 'pinkfloyd#david'
  get '/richard' => 'pinkfloyd#richard'
  get '/nick' => 'pinkfloyd#nick'
  get '/syd' => 'pinkfloyd#syd'
  get '/tour_dates' => 'pinkfloyd#tour_dates'
  get '/records' => 'pinkfloyd#records'
  root :to => 'pinkfloyd#pinkfloyd'

end
