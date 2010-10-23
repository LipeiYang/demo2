class OrderFiltersController < ApplicationController

  def create
    cookies[:by_esti_cost] = params[:by_esti_cost]
    session[:criteria_order] = OrderFilter.new(params[:order_filter])
    redirect_to orders_path
  end

end
