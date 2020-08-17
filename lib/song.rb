require 'pry'
class Song 
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(song)
    new_song = self.new(song)
    new_song.save
    new_song
  end
  
end