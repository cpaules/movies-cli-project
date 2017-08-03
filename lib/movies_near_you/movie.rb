class Movie

  attr_accessor :name, :url
  attr_reader #:director, #:rating

  @@all = []

  def initialize(name, director=nil, rating=nil)
    @name = name
    self.director=(director)
    self.rating=(rating)
    #@@all << self
  end

  def director=(director)
    if director
      @director = director
      director.movie = self
    end
  end

  def director
    @director
  end

  def rating=(rating)
    if rating
      @rating = rating
      rating.movie = self
    end
  end

  def rating
    @rating
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0]) #artist_name
    song_name = data[1].split(".")[0] #song name.mp3 -> song name
    genre_name = data[2].split(".")[0]
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(song_name, artist, genre)
    genre.add_song(song)
    artist.add_song(song)
    song
  end

  def self.all
    @@all
  end

end
