class ReceivablesController < ApplicationController
  # GET /receivables
  # GET /receivables.xml
  def index
    if params[:criteria_receivable].blank?
      session[:criteria_receivable] ||= CriteriaReceivable.new
    else
      session[:criteria_receivable] = CriteriaReceivable.new(params[:criteria_receivable])
    end
    @criteria_receivable = session[:criteria_receivable]
    @receivables = Receivable.search_receivables(@criteria_receivable)
    
    @unpaid_orders = Order.find_all_by_is_paied('no')
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @receivables }
    end
  end

  # GET /receivables/1
  # GET /receivables/1.xml
  def show
    @receivable = Receivable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receivable }
    end
  end

  # GET /receivables/new
  # GET /receivables/new.xml
  def new
    @receivable = Receivable.new
    @receivable.seq_no = get_next_id(Receivable)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @receivable }
    end
  end

  # GET /receivables/1/edit
  def edit
    @receivable = Receivable.find(params[:id])
  end

  # POST /receivables
  # POST /receivables.xml
  def create
    @receivable = Receivable.new(params[:receivable])

    respond_to do |format|
      if @receivable.save
        format.html { redirect_to(@receivable, :notice => 'Receivable was successfully created.') }
        format.xml  { render :xml => @receivable, :status => :created, :location => @receivable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @receivable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /receivables/1
  # PUT /receivables/1.xml
  def update
    @receivable = Receivable.find(params[:id])

    respond_to do |format|
      if @receivable.update_attributes(params[:receivable])
        format.html { redirect_to(@receivable, :notice => 'Receivable was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @receivable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /receivables/1
  # DELETE /receivables/1.xml
  def destroy
    @receivable = Receivable.find(params[:id])
    @receivable.destroy

    respond_to do |format|
      format.html { redirect_to(receivables_url) }
      format.xml  { head :ok }
    end
  end
end
