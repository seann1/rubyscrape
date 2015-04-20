require 'nokogiri'
require 'open-uri'

class SearchesController < ApplicationController
  def index
  	@searchDisplay = Nokogiri::HTML(open("http://www.walmart.com/ip/Lost-The-Complete-Third-Season-Unexplored-Experience-Widescreen/5978156"))
  	@wordArray = []

  	@searchDisplay.css(".ResponsiveContainer").each do |item|  
   		@wordArray << item.text.gsub(/\s+/, " ")
		end

		@wordArray

  end
end
