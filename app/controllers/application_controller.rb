class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
  #http_basic_authenticate_with :name =>"frodo", :password =>"thering"
end
