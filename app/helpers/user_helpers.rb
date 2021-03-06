helpers do
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    !!session[:user_id]
  end
end
