require 'pry'
class Song 
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist != nil ? self.artist=(artist) : @artist = nil
    genre != nil ? self.genre=(genre) : @genre = nil
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
    self.new(song).tap {|new_song| new_song.save}
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end  
   
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist = Artist.find_or_create_by_name(data[0])
    genre = Genre.find_or_create_by_name(data[2].chomp(".mp3"))
    song = self.new(data[1], artist, genre)
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
 
end