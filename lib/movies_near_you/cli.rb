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

  end

  def list_movies #display in numbered list

  end

  def menu
    puts "Enter the number corresponding to which movie you would like to know more about, or enter exit to exit"
    #should then ask what info would they like to see. ex imdb rating, genres, summary, showtimes
    # when displaying showtimes, should display a list of theaters and their showtimes
    input = nil
    while input != "exit"
      input = gets.strip.downcase

    end
  end

  def bye
    puts "Thank you for using Movies Near You!"
  end

end
