class Movie

  attr_accessor :name, :director, :rating, :url
  #attr_reader :rating, :director

  @@all = []

  def initialize(name, director=nil, rating=nil)
    @name = name
    self.director=(director)
    self.rating=(rating)
    @@all << self
  end

  def director=(director)
    if director
      @director = director
      director.add_movie(self)
    end
  end

  def rating=(rating)
    if rating
      @rating = rating
      rating.movies << self unless rating.movies.include?(self)
    end
  end

  def self.all
    @@all
  end

end
