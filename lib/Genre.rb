


class Genre 
  
  extend Concerns::Findable
  
  attr_accessor :name 
  
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
  
  def save 
    
  end
  
  def self.create(genre) 
    Genre.new(genre)
  end
  
  def songs 
    @songs 
  end 
  
  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end 
  
  def artists
    @songs.collect {|song|song.artist}.uniq
  end
  
  
end