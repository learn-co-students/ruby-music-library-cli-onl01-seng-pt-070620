require "pry"

class Song 
  attr_accessor :name, :songs, :artist 
  
  @@all = []
  
  def initialize(name, artist = nil)
    @name = name
    @songs = []
    self.artist = (artist) if artist !=nil
  end
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(song)
    song = self.new(song)
    song.save
    song
  end
  
end