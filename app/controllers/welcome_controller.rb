class WelcomeController < ApplicationController
  def index
    @gifs = Gif.all
    
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
  
  def about
    
  end
end