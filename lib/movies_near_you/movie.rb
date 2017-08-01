class Movie

  attr_accessor :name
  attr_reader :rating, :director

  @@all = []

  def initialize(name, director=nil, rating=nil)
    @name = name
    self.director=(director)
    self.rating=(rating)
    @@all << self
  end

  def self.all
    @@all
  end

end
