get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/signup' do
end

get '/login' do
  erb :login
end

get '/signout' do
end
