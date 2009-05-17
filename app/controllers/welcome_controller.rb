class WelcomeController < ApplicationController

  def index
    redirect_to('/account/login') and return if session['user'] == nil
    @scraps = Scrap.find(:all, :conditions=>["user_id=?",session['user'].id])
  end
  
end
