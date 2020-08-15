require "pry"


class Artist 
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def save 
    
  end
  
  def self.create(artist) 
    Artist.new(artist)
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end 

    #binding.pry
    
  def genres
    @songs.collect {|song|song.genre}.uniq
  end
  
  
  
end