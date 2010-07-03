class HistoryPointsController < ApplicationController
  # GET /history_points
  # GET /history_points.xml
  def index
    @history_points = HistoryPoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @history_points }
    end
  end

  # GET /history_points/1
  # GET /history_points/1.xml
  def show
    @history_point = HistoryPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @history_point }
    end
  end

  # GET /history_points/new
  # GET /history_points/new.xml
  def new
    @history_point = HistoryPoint.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @history_point }
    end
  end

  # GET /history_points/1/edit
  def edit
    @history_point = HistoryPoint.find(params[:id])
  end

  # POST /history_points
  # POST /history_points.xml
  def create
    @history_point = HistoryPoint.new(params[:history_point])

    respond_to do |format|
      if @history_point.save
        format.html { redirect_to(@history_point, :notice => 'HistoryPoint was successfully created.') }
        format.xml  { render :xml => @history_point, :status => :created, :location => @history_point }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @history_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /history_points/1
  # PUT /history_points/1.xml
  def update
    @history_point = HistoryPoint.find(params[:id])

    respond_to do |format|
      if @history_point.update_attributes(params[:history_point])
        format.html { redirect_to(@history_point, :notice => 'HistoryPoint was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @history_point.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /history_points/1
  # DELETE /history_points/1.xml
  def destroy
    @history_point = HistoryPoint.find(params[:id])
    @history_point.destroy

    respond_to do |format|
      format.html { redirect_to(history_points_url) }
      format.xml  { head :ok }
    end
  end
end
