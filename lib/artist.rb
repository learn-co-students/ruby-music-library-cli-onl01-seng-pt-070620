require 'pry'
class Artist
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
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
    self.new(name).save
    self
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless songs.include?(song)
  end

  # def self.find_or_create_by_name(name)
  #   self.find(name) ? self.find(name) : self.new(name)
  # end

  # def self.find(name)
  #   self.all.find {|artist| artist.name == name }
  # end
  
  def genres
    songs.map {|song| song.genre}.uniq
  end
  
end