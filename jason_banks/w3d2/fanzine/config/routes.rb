Fanzine::Application.routes.draw do
  get '/' => 'home#home'
  get '/about' => 'home#about'
  get '/band' => 'band#index'
  get '/band/bandmember2' => 'band#bandmember2'
  get '/band/bandmember2' => 'band#bandmember2'
  get '/band/bandmember3' => 'band#bandmember3'
  get '/av' => 'home#audiovisual'
  get '/merch' => 'home#merchandise'
end
