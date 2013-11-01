require 'nokogiri'
require 'open-uri'
require 'debugger'

page = Nokogiri::XML(open("http://www.rottentomatoes.com/movie/in-theaters/"))

# debugger

movies = page.css('div.heading.clearfix h2 a')
rating = page.css('div.heading.clearfix span.tMeterScore')
poster = page.css('a.media_block_image.big img')

File.open('movies.html', 'w') do |x|
    x.puts("<html>")
    x.puts("<head>")
    x.puts("<link type='text/css' rel='stylesheet' hrex='stylesheet.css'/>")
    x.puts("<meta charset='UTF-8'>")
    x.puts("<link rel='shortcut icon' hrex='http://www.rottentomatoes.com/favicon.ico'>")
    x.puts("<title>Rotten Tomatoes - Now Playing</title>")
    x.puts("</head>")
    x.puts("<body>")
    x.puts("<div class = 'Header'><h1>Rotten Tomatoes - Now Playing</h2></div>")
    x.puts("<div class = 'content'>")
    x.puts("<div class = 'title'>")
  movies.each do |title|
    x.puts("<p>" + title.text + "</p>")
  end
    x.puts("</div>")
    x.puts("<div class = 'ratings'>")
  rating.each do |num|
    x.puts("<p>" + num.text + "</p>")
  end
    x.puts("</div>")
    x.puts("<div class = 'picture'>")
  poster.each do |picture|
    x.puts picture
  end
    x.puts("</div>")
    x.puts("</div>")
    x.puts("</body>")
    x.puts("</html>")
end