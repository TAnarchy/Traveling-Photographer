require 'net/http'
require 'rexml/document'


class MyWeb
	attr_accessor :myDuration, :myDistance
	
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
		
		print xml_result_set.body
		print xml_result_set.to_s + "\n"
		
		doc = REXML::Document.new(xml_result_set.body)
		result = []
		result2 = []
		REXML::XPath.each( doc, "//duration/text") { |element| result << element.text }
		@myDuration = result[0]
		REXML::XPath.each( doc, "//distance/text") { |element2| result2 << element2.text }
		@myDistance = result2[0]
				
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





