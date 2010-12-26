class ProcTypesController < ApplicationController
  # GET /proc_types
  # GET /proc_types.xml
  def index
    @proc_types = ProcType.list

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json=>@proc_types } 
      format.xml  { render :xml => @proc_types }
    end
  end

  # GET /proc_types/1
  # GET /proc_types/1.xml
  def show
    @proc_type = ProcType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json=>@proc_type }
      format.xml  { render :xml => @proc_type }
    end
  end

  # GET /proc_types/new
  # GET /proc_types/new.xml
  def new
    @proc_type = ProcType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @proc_type }
    end
  end

  # GET /proc_types/1/edit
  def edit
    @proc_type = ProcType.find(params[:id])
  end

  # POST /proc_types
  # POST /proc_types.xml
  def create
    @proc_type = ProcType.new(params[:proc_type])

    respond_to do |format|
      if @proc_type.save
        format.html { redirect_to(@proc_type, :notice => 'ProcType was successfully created.') }
        format.xml  { render :xml => @proc_type, :status => :created, :location => @proc_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @proc_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /proc_types/1
  # PUT /proc_types/1.xml
  def update
    @proc_type = ProcType.find(params[:id])

    respond_to do |format|
      if @proc_type.update_attributes(params[:proc_type])
        format.html { redirect_to(@proc_type, :notice => 'ProcType was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @proc_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /proc_types/1
  # DELETE /proc_types/1.xml
  def destroy
    @proc_type = ProcType.find(params[:id])
    @proc_type.destroy

    respond_to do |format|
      format.html { redirect_to(proc_types_url) }
      format.xml  { head :ok }
    end
  end
end
