# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController

  skip_before_filter :authorize
  
  # render new.rhtml
  def new
  end

  def create  
    session[:password] = params[:password]  
    redirect_to orders_path  
  end  
    
  def destroy  
    reset_session  
    redirect_to login_path  
  end 

end
