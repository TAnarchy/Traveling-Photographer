class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      respond_to do |format|
        format.html {redirect_to_target_or_default root_url, :notice => "Logged in successfully."}
        format.xml {render :xml => {:result => "OK"}.to_xml}
      end
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end
end
