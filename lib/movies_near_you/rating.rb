class Rating

  attr_accessor :name, :rating

  @@all = []

  def initialize(name)
    @name = name
    @movies = []
  end

  def create(name)
    rating = self.new(name)
    @@all << self
    rating
  end

  def add_movie(movie)
    @movies << movie unless @movies.include?(movie)
    movie.director = self unless movie.director
  end

  def self.all
    @@all
  end

end
