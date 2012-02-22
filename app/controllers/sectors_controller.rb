class SectorsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create, :destroy, :new, :update]
  # GET /sectors
  # GET /sectors.xml
  def index
    @sectors = Sector.all
    if params[:term]
      @sectors = Sector.find(:all, :conditions => ["LOWER(sector_name) LIKE LOWER(?)", "%#{params[:term]}%"])
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sectors }
      format.js  { render :json => @sectors.map {|p| {  :label => p.sector_name  , :value => p.id}} }
      
    end
  end

  # GET /sectors/1
  # GET /sectors/1.xml
  def show
    @sector = Sector.find(params[:id])
    @title =  "Sector : "+@sector.sector_name
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sector }
      format.js  { render :json => @sector }
    end
  end

  # GET /sectors/new
  # GET /sectors/new.xml
  def new
    @sector = Sector.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sector }
    end
  end

  # GET /sectors/1/edit
  def edit
    @sector = Sector.find(params[:id])
  end

  # POST /sectors
  # POST /sectors.xml
  def create
    @sector = Sector.new(params[:sector])

    respond_to do |format|
      if @sector.save
        format.html { redirect_to(@sector, :notice => 'Sector was successfully created.') }
        format.xml  { render :xml => @sector, :status => :created, :location => @sector }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sector.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sectors/1
  # PUT /sectors/1.xml
  def update
    @sector = Sector.find(params[:id])

    respond_to do |format|
      if @sector.update_attributes(params[:sector])
        format.html { redirect_to(@sector, :notice => 'Sector was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sector.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sectors/1
  # DELETE /sectors/1.xml
  def destroy
    @sector = Sector.find(params[:id])
    @sector.destroy

    respond_to do |format|
      format.html { redirect_to(sectors_url) }
      format.xml  { head :ok }
    end
  end
end
