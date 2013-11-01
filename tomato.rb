require 'nokogiri'
require 'open-uri'
require 'debugger'

page = Nokogiri::XML(open("http://www.rottentomatoes.com/movie/in-theaters/"))

#debugger 

movies = page.css('div.media_block.movie_item')

title = movies.css('div.heading.clearfix h2 a') 
rating = movies.css('div.heading.clearfix span.tMeterScore') 
poster = movies.css('div.heading.clearfix h2 a') 

movie_hash[:title] = page.css('div.heading.clearfix h2 a')
movie_hash[:rating] = page.css('div.heading.clearfix span.tMeterScore')
movie_hash[:poster] = page.css('div.heading.clearfix h2 a')


