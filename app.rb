require 'sinatra'
require 'sinatra/activerecord'
enable :sessions

set :database, "sqlite3:Login.sqlite3"

get '/' do

erb :home
end

get '/signup'do
  erb :signup
end

post '/signup'do
  p params
  user = User.new(
    email: params['email'],
    full_name: params['fullname'],
    password: params['password']
  )
  user.save
  redirect :home
end

get '/login' do
  erb :login
end

post '/login' do
  email = params['email']
  given_password = params['password']
  #check if email exists
  #check to see if the email has a password == form password
  user = User.find_by(email: email)
  if user.password == given_password
    session[:user] = "#{email}"
    redirect :account
  else
    p "Invalid credentials"
    redirect '/'
  end
end

get '/account' do
  erb :account
end

get '/logout' do
  session[:user] = nil
  p 'user has logged out'

  redirect '/'
end

require "./models"
