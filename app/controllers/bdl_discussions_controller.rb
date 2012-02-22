class BdlDiscussionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create, :destroy, :new, :update]
  
  # GET /bdl_discussions
  # GET /bdl_discussions.xml
  def index
    @bdl_discussions = BdlDiscussion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bdl_discussions }
    end
  end

  # GET /bdl_discussions/1
  # GET /bdl_discussions/1.xml
  def show
    @bdl_discussion = BdlDiscussion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bdl_discussion }
    end
  end

  # GET /bdl_discussions/new
  # GET /bdl_discussions/new.xml
  def new
    @bdl_discussion = BdlDiscussion.new
    if params[:stock]
      @bdl_discussion.stock_id = params[:stock]
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bdl_discussion }
    end
  end

  # GET /bdl_discussions/1/edit
  def edit
    @bdl_discussion = BdlDiscussion.find(params[:id])
  end

  # POST /bdl_discussions
  # POST /bdl_discussions.xml
  def create
  	if params[:bdl_discussion][:discussion_date] && !params[:bdl_discussion][:discussion_date].empty?
    	params[:bdl_discussion][:discussion_date] = DateTime.strptime(params[:bdl_discussion][:discussion_date], "%d/%m/%Y").strftime("%Y-%m-%d")
    end

    @bdl_discussion = BdlDiscussion.new(params[:bdl_discussion])
	
    respond_to do |format|
      if @bdl_discussion.save
        format.html { redirect_to(@bdl_discussion, :notice => 'Bdl discussion was successfully created.') }
        format.xml  { render :xml => @bdl_discussion, :status => :created, :location => @bdl_discussion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bdl_discussion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bdl_discussions/1
  # PUT /bdl_discussions/1.xml
  def update
    @bdl_discussion = BdlDiscussion.find(params[:id]) 
    if params[:bdl_discussion][:discussion_date] && !params[:bdl_discussion][:discussion_date].empty?
   		params[:bdl_discussion][:discussion_date] = DateTime.strptime(params[:bdl_discussion][:discussion_date], "%d/%m/%Y").strftime("%Y-%m-%d")
	end

    respond_to do |format|
      if @bdl_discussion.update_attributes(params[:bdl_discussion])
        format.html { redirect_to(@bdl_discussion, :notice => 'Bdl discussion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bdl_discussion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bdl_discussions/1
  # DELETE /bdl_discussions/1.xml
  def destroy
    @bdl_discussion = BdlDiscussion.find(params[:id])
    @bdl_discussion.destroy

    respond_to do |format|
      format.html { redirect_to(bdl_discussions_url) }
      format.xml  { head :ok }
    end
  end
end
