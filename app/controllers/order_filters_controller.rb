class OrderFiltersController < ApplicationController

  def create
    cookies[:by_esti_cost] = params[:by_esti_cost]
    @order_filter = OrderFilter.new(params[:order_filter])
    puts "@order_filter-->#{@order_filter.s_paid==''}"
    session[:criteria_order] = @order_filter
    redirect_to orders_path
  end

end
