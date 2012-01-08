class TravelDataController < ApplicationController
	http_basic_authenticate_with :name =>Authentication.first.username, :password =>Authentication.first.password
	
  # GET /travel_data
  # GET /travel_data.json
  def index
  	  @travel_data = TravelDatum.order("Date")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @travel_data }
    end
  end

  # GET /travel_data/1
  # GET /travel_data/1.json
  def show
    @travel_datum = TravelDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @travel_datum }
    end
  end

  # GET /travel_data/new
  # GET /travel_data/new.json
  def new
    @travel_datum = TravelDatum.new
    @travel_datum.StartTime = Time.now.beginning_of_day + 9.hours
    @travel_datum.EndOfBusiness = Time.now.beginning_of_day+17.hours

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @travel_datum }
    end
  end

  # GET /travel_data/1/edit
  def edit
    @travel_datum = TravelDatum.find(params[:id])
  end

  # POST /travel_data
  # POST /travel_data.json
  def create
    @travel_datum = TravelDatum.new(params[:travel_datum])
    respond_to do |format|
      if @travel_datum.save
      	      format.html { redirect_to @travel_datum, :notice => 'Travel date was successfully created.' }
        format.json { render :json => @travel_datum, :status => :created, :location => @travel_datum }
      else
        format.html { render :action => "new" }
        format.json { render :json => @travel_datum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /travel_data/1
  # PUT /travel_data/1.json
  def update
    @travel_datum = TravelDatum.find(params[:id])
    respond_to do |format|
      if @travel_datum.update_attributes(params[:travel_datum])
        format.html { redirect_to @travel_datum, :notice => 'Travel datum was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @travel_datum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_data/1
  # DELETE /travel_data/1.json
  def destroy
    @travel_datum = TravelDatum.find(params[:id])
    @destroyID = @travel_datum.id
    @travel_datum.destroy

    respond_to do |format|
      format.html { redirect_to travel_data_url }
      format.json { head :ok }
      format.js
     # format.js
    end
  end
  
  def logout
  	  @current_user= ""
  	 redirect_to root_url
  end
end

	
