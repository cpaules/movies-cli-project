class MoviesNearYou::CLI

  def call
    list_movies
    menu
    #if input.size != 5 #or contains only numbers
    #  call
    #else
    #  return #rest of call
    #end

  end

  def list_movies #scrapes and displays movies in a numbered list
    puts "Enter your 5 digit zip code:"
    zipcode = gets.strip
  end

  def menu
    puts "Enter the number corresponding to which movie you would like to know more about"
    input = gets.strips
  end

end
