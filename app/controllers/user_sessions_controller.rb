class UserSessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]
  skip_before_filter :set_db_schema, :set_current_user
  skip_after_filter :clear_db_schema
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      # flash[:notice] = t(:hello, :name => current_user.name)
      unless current_user.admin? 
        redirect_to orders_path
      else
        redirect_to users_path
      end
    else
      redirect_to login_path
    end
  end
  
  def destroy
    current_user_session.destroy
    # flash[:notice] = "Logout successful!"
    reset_session
    redirect_to login_path
  end
end
