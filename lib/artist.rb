class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def songs
    @songs
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def add_song(song)
    song.artist = self if !song.artist
    @songs << song if !@songs.include?(song)
  end
  
  def genres
    genres = []
    @songs.each do |song|
      genres << song.genre
    end
    genres.uniq
  end
 
end