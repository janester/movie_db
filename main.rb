require 'pg'
require "HTTParty"
require "JSON"



def pop_database
  print "Please enter a movie title: "
  movie = gets.chomp
  movie = movie.gsub(" ","+")
  url = "http://www.omdbapi.com/?i=&t=#{movie}"
  html = HTTParty.get(url).gsub("'", "")
  hash = JSON(html)
  sql = "insert into movie_info (title, year, rated, released, runtime, genre, director, writer, actors, plot, poster, imdbrating, imdbvotes, imdbid, response) values ('#{hash["Title"]}', '#{hash["Year"]}', '#{hash["Rated"]}', '#{hash["Released"]}', '#{hash["Runtime"]}', '#{hash["Genre"]}', '#{hash["Director"]}', '#{hash["Writer"]}', '#{hash["Actors"]}', '#{hash["Plot"]}', '#{hash["Poster"]}', '#{hash["imdbRating"]}', '#{hash["imdbVotes"]}', '#{hash["imdbID"]}', '#{hash["Response"]}')"


  conn = PG.connect(:dbname =>'movies', :host => 'localhost')
  conn.exec(sql)
  conn.close
end

puts `clear`
print "Enter a (m)ovie or (q)uit: "
response = gets.chomp.downcase

while response != "q"
  pop_database
  puts "It's done!"
  gets
  puts `clear`
  print "Enter a (m)ovie or (q)uit: "
  response = gets.chomp.downcase
end


# sql = "insert into people (first, last, dob, rel, city) values ('#{name[0]}', '#{name[1]}', '#{dob}', '#{rel}', '#{city}');"
# conn.exec(sql)
