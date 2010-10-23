class OrderFiltersController < ApplicationController

  def create
    cookies[:by_esti_cost] = params[:by_esti_cost]
    session[:order_filter] = OrderFilter.new(params[:order_filter])
    redirect_to orders_path
  end

end
