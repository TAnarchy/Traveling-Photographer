module TravelDataHelper
	def get_directions_url(destinationAddress)
		googleLink ="http://maps.google.com/maps?"
		currUrl = googleLink+"saddr="+stingToURLParameter(Constant.first.home_address)
		currUrl= currUrl+"&daddr="+stingToURLParameter(destinationAddress)
	end
	
	def stingToURLParameter(param)
		toReturn=param.clone
		toReturn.gsub!(", ","+")
		toReturn.gsub!(" ","+")
		return toReturn
	end
end
