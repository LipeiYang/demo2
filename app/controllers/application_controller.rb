# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  before_filter :set_locale
  
  def set_locale
    I18n.locale = params[:locale]
  end
  

  helper_method :admin?    
  protected  
  def admin?
    session[:password] == "158158"  
  end     
  
  def authorize  
    unless admin?  
      flash[:error] = "Unauthorized access"
      redirect_to login_path  
      false  
    end  
  end 
  
  def get_next_id(m)
    unless m.last.blank?
      m.last.id+1
    else
      1
    end
  end
end
