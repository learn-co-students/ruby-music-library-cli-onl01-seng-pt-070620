require 'pry'
require_relative '../lib/concerns/findable'
class Genre
   extend Concerns::Findable
   
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    
  end

  def self.all
    @@all 
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(genre)
    genre = Genre.new(genre)
    genre.save
    genre
  end
  
  def artists
    songs.collect {|s| s.artist}.uniq
  end
end