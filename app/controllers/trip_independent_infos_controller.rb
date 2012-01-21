class TripIndependentInfosController < ApplicationController
  #http_basic_authenticate_with :name =>User.first.user_name, :password =>User.first.password
  # GET /trip_independent_infos
  # GET /trip_independent_infos.json
  def index
    @trip_independent_infos = TripIndependentInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @trip_independent_infos }
    end
  end

  # GET /trip_independent_infos/1
  # GET /trip_independent_infos/1.json
  def show
    @trip_independent_info = TripIndependentInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @trip_independent_info }
    end
  end

  # GET /trip_independent_infos/new
  # GET /trip_independent_infos/new.json
  def new
    @trip_independent_info = TripIndependentInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @trip_independent_info }
    end
  end

  # GET /trip_independent_infos/1/edit
  def edit
    @trip_independent_info = TripIndependentInfo.find(params[:id])
  end

  # POST /trip_independent_infos
  # POST /trip_independent_infos.json
  def create
    @trip_independent_info = TripIndependentInfo.new(params[:trip_independent_info])

    respond_to do |format|
      if @trip_independent_info.save
        format.html { redirect_to @trip_independent_info, :notice => 'Trip independent info was successfully created.' }
        format.json { render :json => @trip_independent_info, :status => :created, :location => @trip_independent_info }
      else
        format.html { render :action => "new" }
        format.json { render :json => @trip_independent_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trip_independent_infos/1
  # PUT /trip_independent_infos/1.json
  def update
    @trip_independent_info = TripIndependentInfo.find(params[:id])

    respond_to do |format|
      if @trip_independent_info.update_attributes(params[:trip_independent_info])
        format.html { redirect_to @trip_independent_info, :notice => 'Trip independent info was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @trip_independent_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_independent_infos/1
  # DELETE /trip_independent_infos/1.json
  def destroy
    @trip_independent_info = TripIndependentInfo.find(params[:id])
    @trip_independent_info.destroy

    respond_to do |format|
      format.html { redirect_to trip_independent_infos_url }
      format.json { head :ok }
    end
  end
end
