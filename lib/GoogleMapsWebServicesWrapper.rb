require 'net/http'
require 'rexml/document'


class GoogleMapsWebServicesWrapper
	attr_accessor :duration, :distance
  
  def initialize(org,dest)
    send_request(org,dest)
    parse_xml
    format_duration_and_distance
  end
		
  def send_request(org,dest)
    google_web_service_url = 'http://maps.googleapis.com/maps/api/distancematrix/xml'
    sensor = 'false'
    directions_origin = string_to_url_parameter(org)
    directions_destination = string_to_url_parameter(dest)
    units = 'imperial'
    results_limit = 10
    url = "#{google_web_service_url}?origins=#{directions_origin}&destinations=#{directions_destination}&units=#{units}&sensor=#{sensor}"
    begin
      @xml_result_set = Net::HTTP.get_response(URI.parse(url))
    rescue Exception => e
      puts 'Connection error: ' + e.message
    end
  end
		
  def parse_xml
    doc = REXML::Document.new(@xml_result_set.body)
    result = []
    result2 = []
    REXML::XPath.each( doc, "//duration/text") { |element| result << element.text }
    @duration = result[0]
    REXML::XPath.each( doc, "//distance/text") { |element2| result2 << element2.text }
    @distance = result2[0]
  end
	
  def format_duration_and_distance
    if @duration.include?("hour")
      time =@duration.split(" ")
      hours = time[0].to_i
      minutes = time[2].to_i
      hours = hours * 60
      @duration = hours+minutes
    end
		
    if @distance.include?(",")
      @distance[","]=""
    end
  end
  def string_to_url_parameter(param)
    to_return=param.clone
    to_return.gsub!(", ","+")
    to_return.gsub!(" ","+")
    to_return
  end
	
end





