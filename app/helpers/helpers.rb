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

end
