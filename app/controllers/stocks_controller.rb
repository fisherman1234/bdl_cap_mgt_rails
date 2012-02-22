# encoding: utf-8
class StocksController < ApplicationController

  # GET /stocks
  # GET /stocks.xml
  def index
    @stocks = Stock.all
    
    @user = current_user
    if params[:type]
      case params[:type]
        when 'flagged'
          @stocks = @user.stocks.where(:flagged=>1).to_a
          @title = "Flagged stocks"
        when 'not_flagged'
          @title = "Unflagged stocks"
          @stocks = @user.stocks.where(:not_flagged=>0).to_a
        when 'good_business'
          @title = "Rating : Good business"
          @stocks = Stock.where(:rating=>'Good Business')
        when 'bad_business'
          @title = "Rating : Bad business"
          @stocks = Stock.where(:rating=>'Bad Business')
        when 'neutral'
          @title = "Rating : Neutral"
          @stocks = Stock.where(:rating=>'Neutral')
        when 'not_in_portfolio'
          @title = "Stocks not included in portfolio"
          @stocks = Stock.find(:all, :conditions => ["is_in_portfolio = 0 OR is_in_portfolio = ''"])
        when 'my_stocks'
          @title = "My stocks"
          @stocks = current_user.stocks
        when 'my_flagged_stocks'
          @title = "My flagged stocks"
          @stocks = current_user.stocks.where(:flagged=>1)
        when 'portfolio'
          @title = "Stocks in portfolio"
          @stocks = Stock.where(:is_in_portfolio=>1)
        when 'posneutral'
          @stocks = []
          @title = "Position : Neutral"
          Stock.find(:all).each do |stock|
            if stock.last_position == 'Neutral'
              @stocks.push(stock)
            end
          end
        when 'poslong'
          @stocks = []
          @title = "Position : Long"
          Stock.all.each do |stock|
            if stock.last_position == 'Long'
              @stocks.push(stock)
            end
          end
        when 'posshort'
          @stocks = []
          @title = "Position : Short"
          Stock.all.each do |stock|
            if stock.last_position == 'Short'
              @stocks.push(stock)
            end
          end
        end
      end
    
    if params[:term]
      @stocks = Stock.find(:all, :conditions => ["LOWER(stock_name) LIKE LOWER(?)", "%#{params[:term]}%"])
    end
      
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stocks }
      format.js  { render :json => @stocks.map {|p| {  :label => p.stock_name  , :value => p.id}} }
    end
  end

  # GET /stocks/1
  # GET /stocks/1.xml
  def show
    @stock = Stock.find(params[:id])
    @title = "Stock : "+@stock.stock_name.to_s+" ("+@stock.ticker.to_s+' )'
    respond_to do |format|
      format.html {render :layout => 'light'} # show.html.erb
      format.xml  { render :xml => @stock }
      format.js  { render :json => @stock }

      
    end
  end

  # GET /stocks/new
  # GET /stocks/new.xml
  def new
    @stock = Stock.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stock }
    end
  end

  # GET /stocks/1/edit
  def edit
    @stock = Stock.find(params[:id])
    @title = "Stock : "+@stock.try(:stock_name).to_s+" ("+@stock.try(:ticker).to_s+' )'

  end

  # POST /stocks
  # POST /stocks.xml
  def create
    @stock = Stock.new(params[:stock])
    if params[:stock][:flag_date] 
    	params[:stock][:flag_date] = DateTime.strptime(params[:stock][:flag_date], "%d/%m/%Y").strftime("%Y-%m-%d")
	end
    respond_to do |format|
      if @stock.save
        format.html { redirect_to [:edit, @stock] }
        format.xml  { render :xml => @stock, :status => :created, :location => @stock }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stock.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stocks/1
  # PUT /stocks/1.xml
  def update
    @stock = Stock.find(params[:id])
    
	if params[:stock][:flag_date] && !params[:stock][:flag_date].empty?
    	params[:stock][:flag_date] = DateTime.strptime(params[:stock][:flag_date], "%d/%m/%Y").strftime("%Y-%m-%d")
	end

    respond_to do |format|
      if @stock.update_attributes(params[:stock])
        format.html { redirect_to [:edit, @stock] }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stock.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.xml
  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy

    respond_to do |format|
      format.html { redirect_to(stocks_url) }
      format.xml  { head :ok }
    end
  end
  
  def to_pdf
  	filename = 'localhost/stocks/'+params[:id].to_s
    outname = File.join(RAILS_ROOT, 'public','tmp', 'out.pdf')
    


    %x[wkhtmltopdf #{filename} #{outname}]
    send_file(outname, :type => 'application/pdf', :disposition => 'inline')
    return # to avoid double render call
  end
end
