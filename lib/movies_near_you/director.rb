class Director

  attr_accessor :name, :rating, :movie

  @@all = []

  def initialize(name)
    @name = name
    @movies = []
    @@all << self
  end

  def add_movie(movie)
    @movies << movie unless @movies.include?(movie)
    movie.director = self unless movie.director
  end

  def self.all
    @@all
  end

end
