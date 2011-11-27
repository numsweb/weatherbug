class WeatherItem < ActiveRecord::Base
  require "net/http"
  #require "rexml/document"
  #include REXML
  require 'rubygems'
  require 'xml'
  
  def self.get_locations(zip_code)
    #this returns XML
    url = "http://A3436701355.api.wxbug.net/getStationsXML.aspx?ACode=#{API_KEY}&zipCode=#{zip_code}"
    xml = Net::HTTP.get_response(URI.parse(url))
    doc = XML::Parser.string(xml.body).parse
    return doc
  end
  
  def self.get_live_weather(station_id)
    #This returns RSS
    url = "http://api.wxbug.net/getLiveWeatherRSS.aspx?ACode=#{API_KEY}&stationid=#{station_id}&unittype=0"
    @feed = Feedzirra::Feed.fetch_and_parse(url)
    return @feed
  end
  
  
  
  def self.get_forecast(zip_code)
    #This returns RSS
    url = "http://api.wxbug.net/getForecastRSS.aspx?ACode=A3436701355&zipCode=#{zip_code}&unittype=0"
    @feed = Feedzirra::Feed.fetch_and_parse(url)
    return @feed
  end
  
 
  
end
