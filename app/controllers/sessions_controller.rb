class SessionsController < ApplicationController

    
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      respond_to do |format|
        format.html {redirect_to_target_or_default root_url, :notice => "Logged in successfully."}
        format.xml {render :xml => {:result => "1"}.to_xml}
        format.json {render :json => {:result => "100"}.to_json}
      end
    else
      flash.now[:alert] = "Invalid login or password."
      respond_to do |format|
        format.html {render :action => 'new'}
        format.xml {render :xml => {:result =>"0"}.to_xml}
        format.json {render :json => {:result => "0"}.to_json}
      end
    end
  end


  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html {redirect_to root_url, :notice => "You have been logged out."}
      format.xml  {render :xml => {:result => "1"}.to_xml}
    end
  end
end
