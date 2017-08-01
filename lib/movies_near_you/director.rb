class Director

  attr_accessor :name, :rating
  attr_reader :movies

  @@all = []

  def initialize(name)
    @name = name
    @movies = []
    @@all << self
  end

  def create(name) #not working
    director = self.new(name)
    @@all << self
    director
  end

  def add_movie(movie)
    @movies << movie unless @movies.include?(movie)
    movie.director = self unless movie.director
  end

  def self.all
    @@all
  end

end
