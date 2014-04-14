#WORKING DOCUMENT
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

require_relative 'controllers/categories_controller'
require_relative 'models/db_dbase'
require_relative 'models/category'

require_relative 'controllers/portfolios_controller'
require_relative 'models/portfolio'

require_relative 'controllers/stocks_controller'
require_relative 'models/stock'

get '/' do
  erb :home
end



