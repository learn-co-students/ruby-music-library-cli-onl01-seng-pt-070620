require_relative '../lib/concerns/findable'


class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist
    self.genre = genre
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(song)
    Song.new(song)
  end

  def artist=(artist)
      if self.artist == nil
        @artist = artist
      else
        @artist = @artist
      end
      if self.artist != nil
        @artist.add_song(self)
      end
    end

  def genre=(genre)
      if self.genre == nil
        @genre = genre
      else
        @genre = @genre
      end
      if self.genre != nil
        @genre.add_song(self)
      end
    end


  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
       self.find_by_name(name)
    else
       self.create(name)
      end
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.new_from_filename(filename)
    filename = filename.chomp(".mp3").split(" - ")
    artistName = filename[0]
    songName = filename[1]
    genreName = filename[2]
    song = self.create(songName)
    song.artist_name = artistName
    song.genre_name = genreName
    song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
  end

  def genre_name=(name)
    genre = Genre.find_or_create_by_name(name)
    self.genre = genre
    genre.add_song(self)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end