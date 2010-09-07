class AccountController < ApplicationController
  
  
  def edit
  end

  def update_password
    filtered_params={}
    filtered_params[:password] = params[:password]
    filtered_params[:password_confirmation] = params[:password_confirmation]
    if current_user.update_attributes(filtered_params)
      flash[:success] = "Your password was successfully updated"
      redirect_to @user
    else
      render :action => :edit
    end
  end

end
