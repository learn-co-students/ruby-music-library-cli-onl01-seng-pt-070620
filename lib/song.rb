require 'pry'
class Song 
  attr_accessor :name, :genre
  attr_reader :artist
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    # binding.pry
    @name = name 
    self.artist=(artist) unless artist.nil?
    self.genre=(genre) unless genre.nil?
    save
  end
  
  def artist=(artist)
    @artist = artist
    # self.artist.add_song(self)
    self.artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless self.genre.songs.include?(self)
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
  
  def self.create(song)
    self.new(song)
  end
  
  def self.find_by_name(name) 
    self.all.find do |song| 
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    song_artist, song_name, song_genre = filename.split(" - ")
    song_genre = song_genre.split(".").first
    
    song_artist = Artist.find_or_create_by_name(song_artist)
    song_genre = Genre.find_or_create_by_name(song_genre)
    Song.new(song_name, song_artist, song_genre)
    
  end
  
  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end
end