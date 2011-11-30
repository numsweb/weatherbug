class WeatherItem < ActiveRecord::Base
  require "net/http"
  #require "rexml/document"
  #include REXML
  require 'rubygems'
  require 'xml'
  
  def self.get_locations(zip_code)
    #this returns XML
    url = GET_STATIONS_URL + "&zipCode=#{zip_code}"
    xml = Net::HTTP.get_response(URI.parse(url))
    doc = XML::Parser.string(xml.body).parse
    return doc
  end
  
  def self.get_live_weather(station_id)
    #This returns XML
    url = GET_WEATHER_URL + "&stationid=#{station_id}"
    xml = Net::HTTP.get_response(URI.parse(url))
    doc = XML::Parser.string(xml.body).parse
    return doc
  end
  
  
  
  def self.get_forecast(zip_code)
    #This returns XML
    url = GET_FORECAST_URL + "&zipCode=#{zip_code}"
    xml = Net::HTTP.get_response(URI.parse(url))
    doc = XML::Parser.string(xml.body).parse
    return doc
  end
  
 
  
end
