class ReceivableFiltersController < ApplicationController

  def create
    session[:receivable_filter] = ReceivableFilter.new(params[:receivable_filter])
    redirect_to receivables_path
  end

end
