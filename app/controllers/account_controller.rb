class AccountController < ApplicationController
  skip_before_filter :set_db_schema, :store_location
  skip_after_filter :clear_db_schema  
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
      User.validates_presence_of :password
      if @user.update_attributes(filtered_params)
        format.html { redirect_back_or_default(logout_path, :notice => t('Password was successfully updated.')) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def edit_share
    @user = current_user
  end

  def update_share
    filtered_params={}
    filtered_params[:share] = params[:user][:share]
    @user = current_user
    respond_to do |format|
      User.validates_inclusion_of :share, :in => [true, false]
      if @user.update_attributes(filtered_params)
        format.html { render :action => "edit_share" }
      else
        format.html { render :action => "edit_share" }
      end
    end
  end
end
