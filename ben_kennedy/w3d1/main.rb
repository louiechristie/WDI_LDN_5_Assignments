require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative 'controllers/categories_controller'
require_relative 'controllers/portfolios_controller'
require_relative 'models/db_base.rb'
require_relative 'models/category.rb'
require_relative 'models/portfolio.rb'


get '/' do 
  erb :home
end




# binding.pry