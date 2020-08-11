require 'pry'
class Genre 
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists
  @@all = []
  
  def initialize(name)
    @name = name 
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
  
  def self.create(genre)
    self.new(genre)
  end
  
  def artists
    Artist.all.select {|artist| artist}
  end
end