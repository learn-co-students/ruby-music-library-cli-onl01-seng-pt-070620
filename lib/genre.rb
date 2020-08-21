class Genre
  attr_accessor :name, :artist
  @@all =[]
  extend Concerns::Findable
  def initialize(name)
    @name = name
    @artist = artist
    @songs = []
    save
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def save
    @@all << self
  end
  def self.create(name)
    genre = new(name) 
    genre
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if genre.artist == nil
      genre.artist = self 
      @songs << song
    end
  end
  
  def artists
    @songs.collect{|song| song.artist}.uniq
  end
  
  
  
end