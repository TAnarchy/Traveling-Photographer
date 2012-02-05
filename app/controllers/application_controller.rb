class ApplicationController < ActionController::Base
  protect_from_forgery
  #http_basic_authenticate_with :name =>User.first.user_name, :password =>User.first.password
end
