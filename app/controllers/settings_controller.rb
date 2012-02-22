class SettingsController < ApplicationController
  def index
    @title= "Settings"
  end
  
  def new_user
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update_user
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy_user
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
    puts params[:query]
    @query = params[:query]
    @stocks = Stock.find(:all, :conditions => ["(LOWER(stock_name) LIKE LOWER(?)) OR (LOWER(environment) LIKE LOWER(?)) OR (LOWER(business_description) LIKE LOWER(?)) OR (LOWER(competition) LIKE LOWER(?)) OR (LOWER(management) LIKE LOWER(?)) OR (LOWER(investment_case) LIKE LOWER(?)) OR (LOWER(investment_risks_macro) LIKE LOWER(?)) OR (LOWER(investment_risks_micro) LIKE LOWER(?)) OR (LOWER(ticker) LIKE LOWER(?))", "%#{@query}%", "%#{@query}%","%#{@query}%","%#{@query}%","%#{@query}%","%#{@query}%","%#{@query}%","%#{@query}%","%#{@query}%"])

    @sectors = Sector.find(:all, :conditions => ["(LOWER(sector_name) LIKE LOWER(?))","%#{@query}%"])

    @contacts = Contact.find(:all, :conditions => ["(LOWER(name) LIKE LOWER(?))","%#{@query}%"])

    @discussions = BdlDiscussion.find(:all, :conditions => ["(LOWER(view_bdl) LIKE LOWER(?)) OR (LOWER(position_bdl) LIKE LOWER(?))","%#{@query}%","%#{@query}%"])
    
    @details = Detail.find(:all, :conditions => ["(LOWER(sector_analysis_title) LIKE LOWER(?)) OR (LOWER(sector_analysis_text) LIKE LOWER(?))","%#{@query}%","%#{@query}%"])
    
    @meetings = MeetingsResult.find(:all, :conditions => ["(LOWER(meeting_notes) LIKE LOWER(?)) OR (LOWER(meeting_conclusions) LIKE LOWER(?)) OR (LOWER(meeting_object) LIKE LOWER(?))","%#{@query}%","%#{@query}%","%#{@query}%"])
    
    @title = "Search results"
    respond_to do |format|
      format.html
    end
  end
  
  def uploadFile
    params.each do |param|
      puts "---------------------------------"
      begin
        puts param[1].original_filename
        puts param[1].tempfile
        if param[1].original_filename
          name =  param[1].original_filename
          name = File.basename(name)
          name.sub(/[^\w\.\-]/,'_')

          directory = "public/upload"
          # create the file path
          path = File.join(directory, name)
          # write the file
          File.open(path, "wb") { |f| f.write(param[1].tempfile.read) }
        end
      rescue
        puts 'not a file'
      end
    end
    
    render :text => "File has been uploaded successfully"
    
  end
  
  def up
  end
  
end
