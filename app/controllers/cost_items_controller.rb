class CostItemsController < ApplicationController
  # GET /cost_items
  # GET /cost_items.xml
  def index
    @cost_items = CostItem.all :order => 'seq DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cost_items }
    end
  end

  # GET /cost_items/1
  # GET /cost_items/1.xml
  def show
    @cost_item = CostItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cost_item }
    end
  end

  # GET /cost_items/new
  # GET /cost_items/new.xml
  def new
    @cost_item = CostItem.new
    @cost_item.seq = get_next_seq(CostItem)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cost_item }
    end
  end

  # GET /cost_items/1/edit
  def edit
    @cost_item = CostItem.find(params[:id])
  end

  # POST /cost_items
  # POST /cost_items.xml
  def create
    @cost_item = CostItem.new(params[:cost_item])

    respond_to do |format|
      if @cost_item.save
        format.html { redirect_to(@cost_item, :notice => 'CostItem was successfully created.') }
        format.xml  { render :xml => @cost_item, :status => :created, :location => @cost_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cost_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cost_items/1
  # PUT /cost_items/1.xml
  def update
    @cost_item = CostItem.find(params[:id])

    respond_to do |format|
      if @cost_item.update_attributes(params[:cost_item])
        format.html { redirect_to(@cost_item, :notice => 'CostItem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cost_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cost_items/1
  # DELETE /cost_items/1.xml
  def destroy
    @cost_item = CostItem.find(params[:id])
    @cost_item.destroy

    respond_to do |format|
      format.html { redirect_to(cost_items_url) }
      format.xml  { head :ok }
    end
  end
end
