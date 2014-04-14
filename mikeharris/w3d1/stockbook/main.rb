require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

require_relative 'models/dbbase'
require_relative 'models/stock'
require_relative 'models/category'
require_relative 'models/portfolio'
require_relative 'controllers/categories_controller'
require_relative 'controllers/portfolios_controller'




get '/' do 
  erb :home 
end



# binding.pry