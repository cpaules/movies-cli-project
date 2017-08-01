class CLI

  def call
    scrape_movies
    list_movies
    menu
    bye
  end

  def scrape_movies #scrapes 15 movies
    #movies should be an array of movie objects?
    puts "Enter your 5 digit zip code:"
    zipcode = gets.strip
    @movies_arr = []
    nolan = Director.new("Christopher Nolan")
    #nolan = "nolan"
    dunkirk_rating = Rating.new("8.5")
    #dunkirk_rating  = "8.5"
    dunkirk = Movie.new("Dunkirk", nolan, dunkirk_rating)
    @movies_arr << dunkirk
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
        puts "Director - #{@movies_arr[input.to_i - 1].director.name}"
        puts "IMDB rating - #{@movies_arr[input.to_i - 1].rating.rating}"
      end
    end
  end

  def bye
    puts "Thank you for using Movies Near You!"
  end

end
