Fanzine::Application.routes.draw do
  get '/' => 'home#home'
  get '/home' => 'home#home'
  get '/about' => 'home#about'
  get '/band' => 'band#index'
  get '/band/band_member_1' => 'band#band_member_1'
  get '/band/band_member_2' => 'band#band_member_2'
  get '/band/band_member_3' => 'band#band_member_3'
  get '/band/band_member_4' => 'band#band_member_4'
  get '/av' => 'home#audiovisual'
  get '/merch' => 'home#merch'
end
