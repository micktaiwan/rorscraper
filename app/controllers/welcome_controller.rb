class WelcomeController < ApplicationController

  def index
    redirect_to('/account/login') and return if session['user'] == nil
    @scraps = session['user'].scraps
  end
  
end

