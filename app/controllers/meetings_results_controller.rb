class MeetingsResultsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create, :destroy, :new, :update]
  # GET /meetings_results
  # GET /meetings_results.xml
  def index
    @meetings_results = MeetingsResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meetings_results }
    end
  end

  # GET /meetings_results/1
  # GET /meetings_results/1.xml
  def show
    @meetings_result = MeetingsResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meetings_result }
    end
  end

  # GET /meetings_results/new
  # GET /meetings_results/new.xml
  def new
    @meetings_result = MeetingsResult.new
    if params[:stock]
      @meetings_result.stock_id = params[:stock]
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meetings_result }
    end
  end

  # GET /meetings_results/1/edit
  def edit
    @meetings_result = MeetingsResult.find(params[:id])
  end

  # POST /meetings_results
  # POST /meetings_results.xml
  def create
  	if params[:meetings_result][:meeting_date] && !params[:meetings_result][:meeting_date].empty?
    	params[:meetings_result][:meeting_date] = DateTime.strptime(params[:meetings_result][:meeting_date], "%d/%m/%Y").strftime("%Y-%m-%d")
    end

    @meetings_result = MeetingsResult.new(params[:meetings_result])

    respond_to do |format|
      if @meetings_result.save
        format.html { redirect_to(@meetings_result, :notice => 'Meetings result was successfully created.') }
        format.xml  { render :xml => @meetings_result, :status => :created, :location => @meetings_result }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meetings_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meetings_results/1
  # PUT /meetings_results/1.xml
  def update
  
    @meetings_result = MeetingsResult.find(params[:id])
    if params[:meetings_result][:meeting_date] && !params[:meetings_result][:meeting_date].empty?
    params[:meetings_result][:meeting_date] = DateTime.strptime(params[:meetings_result][:meeting_date], "%d/%m/%Y").strftime("%Y-%m-%d")
   	end

    respond_to do |format|
      if @meetings_result.update_attributes(params[:meetings_result])
        format.html { redirect_to(@meetings_result, :notice => 'Meetings result was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meetings_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings_results/1
  # DELETE /meetings_results/1.xml
  def destroy
    @meetings_result = MeetingsResult.find(params[:id])
    @meetings_result.destroy

    respond_to do |format|
      format.html { redirect_to(meetings_results_url) }
      format.xml  { head :ok }
    end
  end
end
