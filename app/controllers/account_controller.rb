class AccountController < ApplicationController
  skip_before_filter :set_db_schema, :store_location
  filter_access_to :all
  
  def edit
    @user = current_user
  end

  def update_password
    filtered_params={}
    filtered_params[:password] = params[:user][:password]
    filtered_params[:password_confirmation] = params[:user][:password_confirmation]
    
    @user = current_user
    respond_to do |format|
      if filtered_params[:password].blank?
        @user.add_empty_passeord_error
        format.html { render :action => "edit" }
      else
        if @user.update_attributes(filtered_params)
          format.html { redirect_back_or_default(logout_path, :notice => t('Password was successfully updated.')) }
        else
          format.html { render :action => "edit" }
        end
      end
      
    end
  end

  def update_share
    filtered_params={}
    filtered_params[:share] = params[:user][:share]
    @user = current_user
    respond_to do |format|
      if @user.update_attributes(filtered_params)
        format.html { render :action => "edit" }
      else
        format.html { render :action => "edit" }
      end
    end
  end
end
