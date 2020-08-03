require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    @name = name
  end

  def save
    self.class.all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_genre(self)
  end

  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name).nil? ? create(name) : find_by_name(name)
  end

  def self.create(name)
    new = Song.new(name)
    new.save
    new
  end

  def self.new_from_filename(filename)

    artist = filename.split("-")[0].strip # 1. artist
    song = filename.split("-")[1].strip # 2. song title
    genre = filename.split("-")[2].strip.gsub!(".mp3", "") # 3. genre
    #binding.pry
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    new(song, artist, genre)

  end

  def self.create_from_filename(filename)
    new = new_from_filename(filename)
    new.save
  end

  def self.destroy_all
    all.clear
  end

  def self.all
    @@all
  end
end