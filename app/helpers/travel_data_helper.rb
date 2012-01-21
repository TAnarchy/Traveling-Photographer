module TravelDataHelper
  
	def get_directions_url(destinationAddress)
	  google_link ="http://maps.google.com/maps?"
	  current_url = google_link+"saddr="+string_to_url_parameter(TripIndependentInfo.first.home_address)
	  current_url= current_url+"&daddr="+string_to_url_parameter(destinationAddress)
	end
	
	def string_to_url_parameter(param)
	  to_return=param.clone
	  to_return.gsub!(", ","+")
	  to_return.gsub!(" ","+")
	  to_return
	end
end
