require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:Login.sqlite3"

get '/login' do
  erb :login
end
