require_relative "../config/environment.rb"
require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []
  @@list = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist
    self.genre = genre
    artist  != nil ? artist.add_genre(genre)  : nil;
    genre   != nil ? genre.add_artist(artist) : nil;
    save
  end

  def self.all
    @@all
  end

  def self.list
    @@list
  end

  def self.destroy_all
    @@all = []
    @@list = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
  end

  def artist=(artist)
    @artist = artist
    if artist != nil
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if genre != nil && !genre.songs.include?(self)
      @genre.songs << self
    end
  end

  def self.find_by_name(name)
    Song.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
       self.create(name)
     else
       song
    end
  end

  def self.genres
    Genre.all
  end

  def self.artists
    Artist.all
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    artist = Artist.find_or_create_by_name(filename[0])
    genre = Genre.find_or_create_by_name(filename[2].split(".")[0])
    Song.new(filename[1], artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
    #if (!Song.all.include?(Song.find_by_name(filename.split(" - ")[1])))
      Song.list << filename.split(".mp3")[0]
    #end
  end

end
