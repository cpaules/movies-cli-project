require 'open-uri'

class CLI

  def call
    scrape_movies
    list_movies
    menu
    bye
  end

  def scrape_movies #scrapes first 15 movies
    puts "Welcome!"
    puts "Enter your 5 digit zip code:"
    zipcode = gets.strip
    puts "Grabbing the first 15 movies!"
    movies_index = Nokogiri::HTML(open("http://www.imdb.com/showtimes/location/US/#{zipcode}"))
    @movies_arr = []
    counter = 0
    movies_index.css(".lister-item").each do |movie|
      title = movie.css('.title').text
      movie_url = movie.css('.title a').attr('href').text
      movie_index  = Nokogiri::HTML(open("http://www.imdb.com#{movie_url}"))
      rating = Rating.new(movie_index.css('span.value').text)
      director = Director.new(movie_index.css('span[@itemprop*=director]').first.text.strip) #some movies have more than one director, so I only the first one
      @movies_arr << Movie.new(title, director, rating)
      counter += 1
      if counter > 14
        break
      end
    end
  end

  def list_movies #display in numbered list
    @movies_arr.each.with_index(1) do |movie, index|
      puts "#{index}. #{movie.name}"
    end
  end

  def menu
    puts "Enter the number corresponding to which movie you would like to know more about, or enter exit to exit"
    #should then ask what info would they like to see. ex imdb rating, genres, summary, showtimes
    # when displaying showtimes, should display a list of theaters and their showtimes
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0
        puts "Title - #{@movies_arr[input.to_i - 1].name}"
        puts "Director - #{@movies_arr[input.to_i - 1].director.name}"
        puts "IMDB rating - #{@movies_arr[input.to_i - 1].rating.rating}"
      end
    end
  end

  def bye
    puts "Thank you for using Movies Near You!"
  end

end
