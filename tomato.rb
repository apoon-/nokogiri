require 'nokogiri'
require 'open-uri'
require 'debugger'

page = Nokogiri::XML(open("http://www.rottentomatoes.com/movie/in-theaters/"))

#debugger 

movies = page.css('div.media_block.movie_item')


File.open('tomatoes.html', 'w') do |x|

    x.puts("<html>")
    x.puts("<head>")
    x.puts("<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300' rel='stylesheet' type='text/css'>")
    x.puts("<link type='text/css' rel='stylesheet' href='stylesheet.css'/>")
    x.puts("<meta charset='UTF-8'>")
    x.puts("<link rel='shortcut icon' href='http://www.rottentomatoes.com/favicon.ico'>")
    x.puts("<title>Rotten Tomatoes - Now Playing</title>")
    x.puts("</head>")
    x.puts("<body>")
    x.puts("<div class = 'header'><h1>Rotten Tomatoes - Now Playing</h2></div>")
    x.puts("<div class = 'content'>")

  movies.each do |m|

    title = m.css('div.heading.clearfix h2 a')
    rating = m.css('div.heading.clearfix span.tMeterScore')
    poster = m.css('a.media_block_image.big img') 

    x.write ("<div class = 'name'>" + title.text + "</div>")
    x.write ("<div class = 'numbers'>" + rating.text + "</div>")
    x.write ("<div class = 'image'>")
    x.write poster
    x.write ("</div>")

  end

    x.puts("</div>")
    x.puts("</body>")
    x.puts("</html>")

end




