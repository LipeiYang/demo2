class UserSessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]
  skip_before_filter :set_db_schema
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t(:hello, :name => current_user.name)
      redirect_to orders_path
    else
      redirect_to login_path
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to login_path
  end
end
