class Rating

  attr_accessor :rating, :director ,:movie

  @@all = []

  def initialize(rating)
    @rating = rating.to_f
    @movies = []
    @@all << self
  end

  def add_movie(movie)
    @movies << movie unless @movies.include?(movie)
    movie.rating = self unless movie.rating
  end

  def self.all
    @@all
  end

  def movies
    @movies
  end

end
