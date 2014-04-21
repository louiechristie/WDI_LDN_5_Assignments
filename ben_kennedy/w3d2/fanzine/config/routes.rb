Links::Application.routes.draw do
  
  get '/home' => 'home#band'
  get '/john' => 'home#john'
  get '/paul' => 'home#paul'
  get '/george' => 'home#george'
  get '/ringo' => 'home#ringo'
  get '/tour_dates' => 'home#tour_dates'
  get '/door' => 'home#door'
  root :to => 'home#start'

end
