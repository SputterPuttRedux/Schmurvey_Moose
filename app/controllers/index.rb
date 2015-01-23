get '/' do
  # Look in app/views/index.erb
  @user = current_user
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.create(params[:user])

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

post '/login' do
  p params[:user][:name]
  p 'vyfvyfvyv' * 50
  @user = User.find_by(name: params[:user][:name])

  if @user.try(:authenticate, params[:user][:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    redirect '/login'
  end

end

get '/signout' do
  session[:user_id] = nil
  redirect "/"
end
