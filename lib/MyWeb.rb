require 'net/http'
require 'rexml/document'


class MyWeb
	attr_accessor :myDuration, :myDistance
	#test
	def initialize(org,dest)
		googleWebService = 'http://maps.googleapis.com/maps/api/distancematrix/xml'
		sensor = 'false'
		origin = stingToURLParameter(org)
		destination = stingToURLParameter(dest)
		units = 'imperial'
		results_limit = 10
		url = "#{googleWebService}?origins=#{origin}&destinations=#{destination}&units=#{units}&sensor=#{sensor}"
		begin
		  xml_result_set = Net::HTTP.get_response(URI.parse(url))
		rescue Exception => e
		  puts 'Connection error: ' + e.message
		end
		
		
		doc = REXML::Document.new(xml_result_set.body)
		result = []
		result2 = []
		REXML::XPath.each( doc, "//duration/text") { |element| result << element.text }
		@myDuration = result[0]
		REXML::XPath.each( doc, "//distance/text") { |element2| result2 << element2.text }
		@myDistance = result2[0]
		
		if @myDuration.include?("hour")
			time =@myDuration.split(" ")
			hours = time[0].to_i
			minutes = time[2].to_i
			hours = hours * 60
			@myDuration = hours+minutes
		end
		
		if @myDistance.include?(",")
			@myDistance[","]=""
		end
		
				
	end
	
	def getDuration
		return @myDuration
	end
	
	def getDistance
		return @myDistance
	end
	
	def stingToURLParameter(param)
		toReturn=param.clone
		toReturn.gsub!(", ","+")
		toReturn.gsub!(" ","+")
		return toReturn
	end
	
end





