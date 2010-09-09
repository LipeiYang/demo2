class PurchasesController < ApplicationController
  include ControllerUtils
  # GET /purchases
  # GET /purchases.xml
  def index

    session[:purchase_start] = get_start_date(params) unless params[:start].blank?
    session[:purchase_start] ||= Date.today-1.days
    @start_date = session[:purchase_start]
    session[:purchase_end] = get_end_date(params) unless params[:end].blank?
    session[:purchase_end] ||= Date.today
    @end_date = session[:purchase_end]
    
    unless params[:qry_pur].blank?
        session[:purchase_product_id] = params[:qry_pur][:product_id]
        session[:purchase_supplier_id] = params[:qry_pur][:supplier_id]
    end
    session[:purchase_product_id] ||= '0'
    session[:purchase_supplier_id] ||= '0'
    @qry_pur = Purchase.new(:product_id=>session[:purchase_product_id], :supplier_id=>session[:purchase_supplier_id])
    
    # @purchases = Purchase.search_purchases(@start_date, @end_date, @qry_ord)

    @purchases = Purchase.all :order => 'date DESC, seq_no DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchases }
    end
  end

  # GET /purchases/1
  # GET /purchases/1.xml
  def show
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase }
    end
  end

  # GET /purchases/new
  # GET /purchases/new.xml
  def new
    @purchase = Purchase.new
    @purchase.seq_no = get_next_id(Purchase)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase }
    end
  end

  # GET /purchases/1/edit
  def edit
    @purchase = Purchase.find(params[:id])
  end

  # POST /purchases
  # POST /purchases.xml
  def create
    @purchase = Purchase.new(params[:purchase])

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to(@purchase, :notice => 'Purchase was successfully created.') }
        format.xml  { render :xml => @purchase, :status => :created, :location => @purchase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchases/1
  # PUT /purchases/1.xml
  def update
    @purchase = Purchase.find(params[:id])

    respond_to do |format|
      if @purchase.update_attributes(params[:purchase])
        format.html { redirect_to(@purchase, :notice => 'Purchase was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.xml
  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to(purchases_url) }
      format.xml  { head :ok }
    end
  end
end
