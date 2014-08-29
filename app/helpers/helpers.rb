helpers do
  def signed_in?
    if session[:user_id] != nil
      User.find(session[:user_id])
    else
      return false
    end
  end

  def invalid?
    session[:invalid]
  end

  def logged_in_user
    User.find(session[:user_id])
  end

end
