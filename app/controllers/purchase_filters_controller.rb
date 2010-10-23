class PurchaseFiltersController < ApplicationController

  def create
    session[:purchase_filter] = PurchaseFilter.new(params[:purchase_filter])
    redirect_to purchases_path
  end

end
