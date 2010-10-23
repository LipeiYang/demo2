class PayableFiltersController < ApplicationController

  def create
    session[:payable_filter] = PayableFilter.new(params[:payable_filter])
    redirect_to payables_path
  end

end
