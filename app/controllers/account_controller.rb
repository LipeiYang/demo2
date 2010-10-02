class AccountController < ApplicationController
  skip_before_filter :set_db_schema
  skip_after_filter :clear_db_schema  
  
  def edit
    @user = current_user
  end

  def update_password
    filtered_params={}
    filtered_params[:password] = params[:user][:password]
    filtered_params[:password_confirmation] = params[:user][:password_confirmation]
    
    @user = current_user
    
    if @user.update_attributes(filtered_params)
      flash[:success] = "Your password was successfully updated"
      redirect_to logout_path
    else
      format.html { render :action => "edit" }
      format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
    end
  end

end
