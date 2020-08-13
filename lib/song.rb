require 'pry'
class Song
  
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name,artist = nil ,genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
   
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def artist=(artist)
     @artist = artist 
     @artist.add_song(self) 
  end
  
  def genre=(genre)
     @genre = genre
     @genre.songs << self if !@genre.songs.include?(self)
  
    # if !@genre.songs.include(self)
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  # def self.find_by_name(name)
  #   @@all.detect{|a| a.name == name}
  # end
  
  # def self.find_or_create_by_name(name)
  #   find_by_name(name) || create(name)
  # end
  
   def self.new_from_filename(file_name)
     data = file_name.split(" - ")
     artist = Artist.find_or_create_by_name(data[0])
     genre = Genre.find_or_create_by_name(data[2].delete_suffix('.mp3'))
     song = Song.new(data[1],artist,genre)
     song
  end
  
  def self.create_from_filename(file_name)
    @@all << new_from_filename(file_name)
  end
  
end