class UserSessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t(:hello, :name => current_user.name)
      redirect_back_or_default orders_path
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    # redirect_back_or_default new_user_session_path
    redirect_to new_user_session_path
  end
end
