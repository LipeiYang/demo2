class InvestsController < ApplicationController
  # GET /invests
  # GET /invests.xml
  def index
    @invests = Invest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invests }
    end
  end

  # GET /invests/1
  # GET /invests/1.xml
  def show
    @invest = Invest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invest }
    end
  end

  # GET /invests/new
  # GET /invests/new.xml
  def new
    @invest = Invest.new
    @invest.seq_no = get_next_id(Invest)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invest }
    end
  end

  # GET /invests/1/edit
  def edit
    @invest = Invest.find(params[:id])
  end

  # POST /invests
  # POST /invests.xml
  def create
    @invest = Invest.new(params[:invest])

    respond_to do |format|
      if @invest.save
        format.html { redirect_to(@invest, :notice => 'Invest was successfully created.') }
        format.xml  { render :xml => @invest, :status => :created, :location => @invest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invests/1
  # PUT /invests/1.xml
  def update
    @invest = Invest.find(params[:id])

    respond_to do |format|
      if @invest.update_attributes(params[:invest])
        format.html { redirect_to(@invest, :notice => 'Invest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invests/1
  # DELETE /invests/1.xml
  def destroy
    @invest = Invest.find(params[:id])
    @invest.destroy

    respond_to do |format|
      format.html { redirect_to(invests_url) }
      format.xml  { head :ok }
    end
  end
end
