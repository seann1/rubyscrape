require 'nokogiri'
require 'open-uri'

class SearchesController < ApplicationController
  def index

  end

  def create
  	url = "http://www.walmart.com/search/?query=" + params[:search]
  	@searchDisplay = Nokogiri::HTML(open(url))
  	@wordArray = []

  	@searchDisplay.css(".js-product-title").each_with_index do |item, index| 
   		@wordArray << { href: item['href'], title: item.text, image: item.xpath('img') }
   		# .text.gsub(/\s+/, " ")
		end

		@wordArray
  end
end
