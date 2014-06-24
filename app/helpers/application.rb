helpers do

  def current_user    
    @current_user ||=Maker.get(session[:maker_id]) if session[:maker_id]
  end

  def pretty_date(time)
   time.strftime("%d %b %Y")
  end

end