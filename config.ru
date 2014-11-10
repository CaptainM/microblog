require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'rubygems'


#Models
require_relative 'models/author.rb'
require_relative 'models/micropost.rb'
require_relative 'models/tag.rb'

#Controllers
require_relative 'controllers/authors_controller.rb'
require_relative 'controllers/home_controller.rb'
require_relative 'controllers/microposts_controller.rb'
require_relative 'controllers/tags_controller.rb'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
after { ActiveRecord::Base.connection.close }

run Sinatra::Application

env[DATABASE_URL]