class OrdersController < ApplicationController
  include ControllerUtils
  # GET /orders
  # GET /orders.xml
  def index
    if params[:criteria_order].blank?
      session[:criteria_order] ||= CriteriaOrder.new
    else
      session[:criteria_order] = CriteriaOrder.new(params[:criteria_order])
    end
    @criteria_order = session[:criteria_order]
    @orders = Order.search_orders(@criteria_order)

    # session[:start] = get_start_date(params) unless params[:start].blank?
    # session[:start] ||= Date.today-1.days
    # @start_date = session[:start]
    # session[:end] = get_end_date(params) unless params[:end].blank?
    # session[:end] ||= Date.today
    # @end_date = session[:end]
    # 
    # unless params[:qry_ord].blank?
    #     session[:product_id] = params[:qry_ord][:product_id].to_i
    #     session[:customer_id] = params[:qry_ord][:customer_id].to_i
    # end
    # session[:product_id] ||= '0'
    # session[:customer_id] ||= '0'
    #   
    # @qry_ord = Order.new(:product_id=>session[:product_id], :customer_id=>session[:customer_id])
    # 
    # @orders = Order.search_orders(@start_date, @end_date, @qry_ord)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new
    @order.seq_no = get_next_id(Order)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to(@order, :notice => 'Order was successfully created.') }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
end
