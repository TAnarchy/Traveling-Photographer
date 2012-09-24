class ApplicationController < ActionController::Base
  include ControllerAuthentication
  include SslRequirement
  protect_from_forgery
end
