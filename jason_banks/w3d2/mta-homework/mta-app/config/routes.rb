MtaApp::Application.routes.draw do
  get '/' => 'home#home'
  post '/' => 'home#choices'
end
