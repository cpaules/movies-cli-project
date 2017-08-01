class Rating

  attr_accessor :rating, :director

  @@all = []

  def initialize(rating)
    @rating = rating.to_f
    @movies = []
    @@all << self
  end

  def create(rating)
    rating = self.new(rating.to_i)
    @@all << self
    rating
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
