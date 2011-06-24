class StocksController < ApplicationController
  before_filter :authenticate_user!
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
              puts 'yo !'
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
            if stock.last_position == 'Normal'
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
      format.html # show.html.erb
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
end
