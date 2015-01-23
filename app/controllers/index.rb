get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.create(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect "/"

  else
    redirect "/signup"
  end

end

get '/login' do
  erb :login
end

get '/signout' do
  session[:user_id] = nil
  redirect "/"
end
