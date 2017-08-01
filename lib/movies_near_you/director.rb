class Director

  attr_accessor :name, :rating

  @@all = []

  def initialize(name)
    @name = name
    @movies = []
  end

  def create(name)
    director = self.new(name)
    @@all << self
    director
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

end
