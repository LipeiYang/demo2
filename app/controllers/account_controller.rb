class AccountController < ApplicationController
  skip_before_filter :set_db_schema, :store_location
  skip_after_filter :clear_db_schema  
  
  def edit
    @user = current_user
  end

  def update_password
    filtered_params={}
    filtered_params[:password] = params[:user][:password]
    filtered_params[:password_confirmation] = params[:user][:password_confirmation]
    
    @user = current_user
    respond_to do |format|
      User.validates_presence_of :password
      if @user.update_attributes(filtered_params)
        format.html { redirect_back_or_default(logout_path, :notice => t('Password was successfully updated.')) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
