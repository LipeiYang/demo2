# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'schema_utils'
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :current_user_session, :current_user
  filter_parameter_logging :password, :password_confirmation

  before_filter :set_locale, :require_user, :set_db_schema, :set_current_user
  after_filter :clear_db_schema


  protected
    def get_next_id(m)
      m.last.blank? ? 1 : m.last.id+1
    end

    def permission_denied
      flash[:error] = "Sorry, you are not allowed to access that page."
      redirect_to login_path
    end
    
    
  private
    def set_locale
      I18n.locale = params[:locale]
    end
    
    def set_current_user
      Authorization.current_user = current_user
    end
    
    def require_user
      unless current_user
        store_location
        redirect_to login_path
        return false
      end
    end
    
    def set_db_schema
      if current_user.admin?
        session[:user] = params[:user] unless params[:user].blank?
        session[:user] ||= current_user.username
        @focused_name = User.find_by_username(session[:user]).name
        SchemaUtils.add_schema_to_path get_schema(session[:user])
      else
        SchemaUtils.add_schema_to_path get_schema(current_user.username)
      end
    end
    
    def get_schema(user_name)
      "leaf_#{user_name}"
    end
    
    def clear_db_schema
      SchemaUtils.reset_search_path
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end

    # def require_no_user
    #   if current_user
    #     store_location
    #     flash[:notice] = "You must be logged out to access this page"
    #     redirect_to orders_path
    #     return false
    #   end
    # end
    
    def store_location
      session[:return_to] = request.request_uri
    end
    
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

end
